# CTRM Domain Documentation (DDD)

## Bounded Contexts
- **Trading** — deal capture, pricing, execution, positions.
- **Risk** — exposure, VaR, stress, limits, hedge effectiveness.
- **Physical Logistics** — deliveries, shipping, storage, quality, inventory.
- **Finance & Settlements** — confirmations, invoicing, payments, FX, accounting.
- **Compliance & Surveillance** — KYC/AML, sanctions, abuse detection, regulatory reports.
- **Market Data** — real-time prices, curves, vol surfaces, fallbacks.
- **Reference & Master Data** — instruments, units, calendars, counterparties, commodity specs.
- **Identity & Access (IAM)** — users, roles, entitlements, approvals.

## Ubiquitous Language
Order, Trade (Fill), Position, Book, Curve, VaR, Limit Breach, Physical Contract, Shipment, Inventory Lot, Confirmation, Invoice, Short-Pay, KYC, Sanctions Hit, Surveillance Case, Regulatory Report, Fallback Feed.

## Aggregates & Events (selected)
### Trading
- **Order** (root): id, side, instrument, qty, price, tif, status, route  
  Events: `OrderPlaced`, `OrderRouted`, `OrderPartiallyFilled`, `OrderRejected`, `OrderCancelled`
- **Trade**: tradeId, orderId, instrument, qty, price, venue, ts
- **Position**: bookId, instrument, netQty, avgPrice  
  Events: `PositionUpdated`

### Risk
- **RiskLimit**: scope(book/trader/product), threshold, breachPolicy  
  Events: `LimitBreached`, `LimitRestored`
- **Valuation**: marks, curves, methodologies (MtM, PFE)
- Read models: `Exposure`, `VaR`

### Physical Logistics
- **PhysicalContract**: quantity, incoterms, qualitySpec, schedule  
  Events: `ShipmentScheduled`, `ShipmentReceived`, `QualityDisputed`
- **InventoryLot**: location, qty, grade, ownership

### Finance & Settlements
- **Confirmation**: matched terms  
  Events: `ConfirmationMatched`, `ConfirmationMismatch`
- **Invoice**: amount, currency, dueDate, status  
  Events: `InvoiceIssued`, `ShortPaymentDetected`, `PaymentReconciled`

### Compliance & Surveillance
- **CounterpartyScreening**: KYC status, sanctions hits  
  Events: `SanctionsHit`
- **SurveillanceCase**: pattern, severity, disposition  
  Events: `SurveillanceAlertRaised`
- **RegulatoryReport**: period, scope, status  
  Events: `ReportSubmitted`, `ReportFailed`

### Market Data
- **PriceFeed**: sources, status, fallback rules  
  Events: `PrimaryFeedDown`, `FallbackActivated`
- **Curve/Surface**: instruments, tenors, method  
  Events: `CurvePublished`

## Context Map (textual)
```
[Market Data] ─▶ (ACL) ─▶ [Trading] ─▶ (Customer/Supplier) ─▶ [Risk]
                               │                                  ▲
                               ├──────────► [Finance] ◄───────────┘ (Shared Kernel: Trade schema)
                               └──────────► [Physical Logistics] ──► [Finance] (Conformist: delivery→invoice)
[Reference Data] ─▶ (Published Language) ─▶ all
[IAM] (Open Host Service) serving all contexts
[Compliance] subscribes to orders/trades/prices; blocks via sanctions checks
```

## Architectural Decisions (highlights)
- Event backbone; outbox pattern; idempotent consumers.
- Saga orchestration for `Order→Execution→Position` and `Shipment→Invoice` flows.
- Deterministic market data fallbacks; circuit breakers to venues.
- Immutable audit log per aggregate; append-only.