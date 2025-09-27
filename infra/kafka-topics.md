# Kafka Topics (proposed)

- `trading.orders.v1` — key: `orderId`, events: `OrderPlaced`, `OrderCancelled`, `OrderRejected`
- `trading.trades.v1` — key: `tradeId`, events: `TradeCaptured`
- `trading.positions.v1` — key: `bookId|instrument`, events: `PositionUpdated`
- `risk.limits.v1` — key: `scope|limitName`, events: `LimitBreached`, `LimitRestored`
- `logistics.shipments.v1` — key: `shipmentId`, events: `ShipmentScheduled`, `ShipmentReceived`
- `finance.invoices.v1` — key: `invoiceId`, events: `InvoiceIssued`, `ShortPaymentDetected`, `PaymentReconciled`
- `compliance.alerts.v1` — key: `caseId`, events: `SurveillanceAlertRaised`
- `marketdata.feeds.v1` — key: `priceFeedId`, events: `PrimaryFeedDown`, `FallbackActivated`

**Conventions**
- Partition by natural key; use compacted topics for slowly-changing read models if needed.
- Include `traceId`, `causationId`, `correlationId` in headers.
- Schema registry: namespace `ctrm.*`, Avro with compatibility=BACKWARD.