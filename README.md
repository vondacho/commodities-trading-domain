# Commodity Trading & Risk Management (CTRM) – Reference Pack

This repository contains a concise, production-minded blueprint for a CTRM platform:
- **Domain documentation** (DDD bounded contexts, aggregates, policies, events).
- **Executable specifications** in **Gherkin** (features & corner cases).
- **Context Mapper DSL (CML)** context map and service cuts.

## Structure
```
.
├── README.md
├── docs/
│   └── domain.md
├── features/
│   ├── market_data.feature
│   ├── trade_execution.feature
│   ├── risk.feature
│   ├── portfolio.feature
│   ├── logistics.feature
│   ├── compliance.feature
│   └── settlements.feature
├── cml/
│   └── ctrm-context-map.cml
├── schemas/
│   ├── events.avsc          # (placeholders) event schemas (Avro/JSON)
│   └── api-openapi.yaml     # (placeholder) API contracts per context
└── infra/
    └── adr-architecture-decisions.md
```

## How to use
- Start with `docs/domain.md` for the big picture.
- Explore `features/*.feature` for behavior-driven specs.
- Use `cml/ctrm-context-map.cml` in the Context Mapper toolchain to visualize the bounded contexts and relationships.
- Extend `schemas/` with your own Avro or OpenAPI contracts and wire into your messaging/API infrastructure.

---

> This pack is intentionally technology-agnostic and event-first. It assumes an event backbone (Kafka/Pulsar), outbox pattern, and strong consistency within aggregates with eventual consistency across contexts.

## New in this bundle
- **Event schemas (Avro)** per context in `/schemas`.
- **OpenAPI stubs** per bounded context in `/apis`.
- **Kafka topics** proposal and **Outbox DDL** in `/infra` and `/sql`.
- **Mermaid diagrams** for context map and aggregates in `/diagrams`.


## Diagrams
- Context map and Trading aggregates are now provided in **PlantUML** (`.puml`) format under `/diagrams`.
You can render them with PlantUML CLI, IDE plugins, or online renderers.


### Sequence Diagrams
PlantUML sequence diagrams in `/diagrams`:
- `sequence-order-execution.puml` — Order → Execution → Position Update
- `sequence-shipment-invoice.puml` — Shipment → Invoice flow
- `sequence-limit-breach.puml` — Pre-trade risk check and rejection


### Deployment Diagram
- `deployment-overview.puml` — shows CTRM services, event backbone, databases, and external systems.


### Component Diagrams
PlantUML component diagrams per bounded context in `/diagrams`:
- `component-trading.puml`
- `component-risk.puml`
- `component-finance.puml`
- `component-logistics.puml`
- `component-compliance.puml`
- `component-marketdata.puml`
- `component-reference.puml`
- `component-iam.puml`


### State Diagrams
PlantUML state diagrams for key aggregates in `/diagrams`:
- `state-order.puml` — Order lifecycle
- `state-invoice.puml` — Invoice lifecycle
- `state-shipment.puml` — Shipment lifecycle


### Activity Diagrams
PlantUML activity diagrams for workflows in `/diagrams`:
- `activity-settlement.puml` — Settlement process
- `activity-kyc.puml` — KYC check process
- `activity-risk-limit.puml` — Risk limit monitoring


### Use Case Diagrams
PlantUML use case diagrams in `/diagrams`:
- `usecase-trading.puml` — Trading interactions
- `usecase-risk.puml` — Risk management interactions
- `usecase-finance.puml` — Finance & Settlements interactions
- `usecase-compliance.puml` — Compliance interactions


### Integration Diagrams
PlantUML diagrams combining use cases and components in `/diagrams`:
- `integration-trading.puml`
- `integration-risk.puml`
- `integration-finance.puml`
- `integration-compliance.puml`


### Global Integration Diagram
- `integration-global.puml` — All contexts, actors, and external systems in one view.


### Combined Deployment + Integration Diagram
- `deployment-integration.puml` — Shows services mapped to contexts, linked to actors, event backbone, databases, and external systems.


## GitHub Actions
A workflow is provided in `.github/workflows/render-diagrams.yml` to automatically render all `.puml` PlantUML diagrams
into **PNG** and **SVG** formats on each commit or pull request. Artifacts will be available in the GitHub Actions run summary.


## MkDocs Site
A `mkdocs.yml` config is provided. You can serve the documentation site locally with:

```bash
pip install mkdocs-material mkdocstrings[python] mkdocs-awesome-pages-plugin mkdocs-mermaid2-plugin
mkdocs serve
```

Then open [http://localhost:8000](http://localhost:8000) to browse.


## GitHub Pages
A GitHub Actions workflow (`.github/workflows/deploy-docs.yml`) is provided to automatically build and publish the MkDocs site
to **GitHub Pages** when changes are pushed to the `main` branch.

Enable GitHub Pages in your repository settings with the `gh-pages` branch as source.


## C4 Model
A dedicated C4 documentation folder is included with PlantUML diagrams for **C1 System Context**, **C2 Containers**, and **C3 Components** (Trading & Risk).


The C4 folder also includes **C3 component diagrams** for Finance, Logistics, and Compliance contexts.


The C4 set is now **complete** with C3 diagrams for all contexts: Trading, Risk, Finance, Logistics, Compliance, Market Data, Reference Data, and IAM.



## Architecture Index
See [ARCHITECTURE-INDEX.md](ARCHITECTURE-INDEX.md) for a complete map of all docs, diagrams, and models.

