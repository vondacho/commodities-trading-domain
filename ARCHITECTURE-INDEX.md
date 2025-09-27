
# CTRM Architecture Index

This document serves as a **map of maps** for the CTRM architecture documentation, models, and diagrams.

---

## 1. Domain Documentation
- [Domain Docs](docs/domain.md)
- [Context Mapper DSL](cml/ctrm-context-map.cml)
- [ADR Decisions](infra/adr-architecture-decisions.md)

## 2. Executable Specifications
- [Market Data](features/market_data.feature)
- [Trade Execution](features/trade_execution.feature)
- [Risk](features/risk.feature)
- [Portfolio](features/portfolio.feature)
- [Logistics](features/logistics.feature)
- [Compliance](features/compliance.feature)
- [Settlements](features/settlements.feature)

## 3. Event Schemas & APIs
- [Avro Schemas](schemas/)
- [OpenAPI Specs](apis/)

## 4. PlantUML Diagrams

### Context & Aggregates
- [Context Map](diagrams/context-map.puml)
- [Trading Aggregates](diagrams/aggregates-trading.puml)

### States
- [Order Lifecycle](diagrams/state-order.puml)
- [Invoice Lifecycle](diagrams/state-invoice.puml)
- [Shipment Lifecycle](diagrams/state-shipment.puml)

### Activities
- [Settlement Process](diagrams/activity-settlement.puml)
- [KYC Process](diagrams/activity-kyc.puml)
- [Risk Limit Monitoring](diagrams/activity-risk-limit.puml)

### Sequences
- [Order Execution](diagrams/sequence-order-execution.puml)
- [Shipment Invoice](diagrams/sequence-shipment-invoice.puml)
- [Limit Breach](diagrams/sequence-limit-breach.puml)

### Use Cases
- [Trading](diagrams/usecase-trading.puml)
- [Risk](diagrams/usecase-risk.puml)
- [Finance](diagrams/usecase-finance.puml)
- [Compliance](diagrams/usecase-compliance.puml)

### Components
- [Trading](diagrams/component-trading.puml)
- [Risk](diagrams/component-risk.puml)
- [Finance](diagrams/component-finance.puml)
- [Logistics](diagrams/component-logistics.puml)
- [Compliance](diagrams/component-compliance.puml)
- [Market Data](diagrams/component-marketdata.puml)
- [Reference](diagrams/component-reference.puml)
- [IAM](diagrams/component-iam.puml)

### Integration
- [Trading](diagrams/integration-trading.puml)
- [Risk](diagrams/integration-risk.puml)
- [Finance](diagrams/integration-finance.puml)
- [Compliance](diagrams/integration-compliance.puml)
- [Global](diagrams/integration-global.puml)

### Deployment
- [Overview](diagrams/deployment-overview.puml)
- [Combined Integration](diagrams/deployment-integration.puml)

## 5. C4 Model

### PlantUML C4
- [System Context (C1)](diagrams/c4/C1-system-context.puml)
- [Containers (C2)](diagrams/c4/C2-containers.puml)
- [Components (Trading)](diagrams/c4/C3-components-trading.puml)
- [Components (Risk)](diagrams/c4/C3-components-risk.puml)
- [Components (Finance)](diagrams/c4/C3-components-finance.puml)
- [Components (Logistics)](diagrams/c4/C3-components-logistics.puml)
- [Components (Compliance)](diagrams/c4/C3-components-compliance.puml)
- [Components (Market Data)](diagrams/c4/C3-components-marketdata.puml)
- [Components (Reference Data)](diagrams/c4/C3-components-reference.puml)
- [Components (IAM)](diagrams/c4/C3-components-iam.puml)

### Structurizr DSL
- [Main Model](diagrams/c4/structurizr.dsl)
- [Trading](diagrams/c4/structurizr-trading.dsl)
- [Risk](diagrams/c4/structurizr-risk.dsl)
- [Finance](diagrams/c4/structurizr-finance.dsl)
- [Logistics](diagrams/c4/structurizr-logistics.dsl)
- [Compliance](diagrams/c4/structurizr-compliance.dsl)
- [Market Data](diagrams/c4/structurizr-marketdata.dsl)
- [Reference](diagrams/c4/structurizr-reference.dsl)
- [IAM](diagrams/c4/structurizr-iam.dsl)
- [Workspace Aggregator](diagrams/c4/workspace.dsl)
- [Developer Guide](docs/c4/DEVELOPER-GUIDE.md)

---

## 6. Documentation Site (MkDocs)
- [mkdocs.yml](mkdocs.yml) (Material theme config)
- Run locally:  
  ```bash
  mkdocs serve
  ```
  → open [http://localhost:8000](http://localhost:8000)

- GitHub Pages workflow auto-publishes the site on each push to `main`.

---

📌 Use this file as a **navigation index** to explore the entire CTRM architecture pack.
