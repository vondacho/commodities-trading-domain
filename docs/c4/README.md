# C4 Model Documentation

This folder provides **C4 diagrams** for the CTRM platform using **C4-PlantUML**:

- **C1 – System Context**: big-picture view of users, external systems, and the CTRM platform.
- **C2 – Containers**: services, databases, and the event backbone with major interactions.
- **C3 – Components (examples)**: internal components for Trading and Risk services.

> Rendering uses remote `!includeurl` references to the official C4-PlantUML library. The provided GitHub Actions workflow (`render-diagrams.yml`) will fetch these includes at build time and produce PNG/SVG artifacts.

## Files
- `diagrams/c4/C1-system-context.puml`
- `diagrams/c4/C2-containers.puml`
- `diagrams/c4/C3-components-trading.puml`
- `diagrams/c4/C3-components-risk.puml`

You can add **C4 Level 4 (Code)** diagrams as needed for specific modules.

Additional **C3 Components** diagrams included:
- `diagrams/c4/C3-components-finance.puml`
- `diagrams/c4/C3-components-logistics.puml`
- `diagrams/c4/C3-components-compliance.puml`


Also included:
- `diagrams/c4/C3-components-marketdata.puml`
- `diagrams/c4/C3-components-reference.puml`
- `diagrams/c4/C3-components-iam.puml`


## Structurizr Component Views
Separate DSL files are provided per bounded context (Trading, Risk, Finance, Logistics, Compliance, Market Data, Reference, IAM)
to mirror the C3 component diagrams.

Files:
- `diagrams/c4/structurizr-trading.dsl`
- `diagrams/c4/structurizr-risk.dsl`
- `diagrams/c4/structurizr-finance.dsl`
- `diagrams/c4/structurizr-logistics.dsl`
- `diagrams/c4/structurizr-compliance.dsl`
- `diagrams/c4/structurizr-marketdata.dsl`
- `diagrams/c4/structurizr-reference.dsl`
- `diagrams/c4/structurizr-iam.dsl`


## Aggregated Workspace
- `diagrams/c4/workspace.dsl` aggregates the main model (`structurizr.dsl`) and all per-context C3 DSL files,
  so you can load the full architecture in one go into Structurizr Lite/Cloud.


See also: [Developer Guide](DEVELOPER-GUIDE.md) for instructions on how to load and explore the C4 model in Structurizr Lite/Cloud.
