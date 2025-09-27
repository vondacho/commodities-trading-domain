
# Developer Guide — C4 Model with Structurizr

This guide explains how to explore the CTRM **C4 model** using [Structurizr](https://structurizr.com/).

---

## 1. Options for Rendering

### Structurizr Lite (local, free)
- Install Structurizr Lite:
  ```bash
  docker run -it --rm -p 8080:8080 -v $PWD:/usr/local/structurizr structurizr/lite
  ```
- Place the repo’s `diagrams/c4/workspace.dsl` file into the mounted directory.
- Open [http://localhost:8080](http://localhost:8080) and navigate to the diagrams.

### Structurizr Cloud
- Create a workspace at [Structurizr Cloud](https://structurizr.com/).
- Upload the `workspace.dsl` file (or paste its content).
- All imported context DSL files (`structurizr-*.dsl`) will be included automatically.

---

## 2. Structure of the C4 DSL

- `structurizr.dsl` — main model with **System Context** and **Container** views.
- `structurizr-*.dsl` — per-bounded-context **Component views**:
  - Trading, Risk, Finance, Logistics, Compliance, Market Data, Reference, IAM.
- `workspace.dsl` — **aggregator**, imports all the above.

---

## 3. Recommended Workflow

1. Start with **C1 (System Context)** to understand users and external systems.
2. Zoom into **C2 (Containers)** for the main services and event backbone.
3. Explore each **C3 (Components)** diagram for internal service breakdowns.
4. Cross-check with the PlantUML `.puml` diagrams if needed.

---

## 4. Tips
- Use **autolayout** in Structurizr for better visual arrangement.
- Switch between views in the sidebar (C1 → C2 → C3).
- Keep DSL files modular (`structurizr-*.dsl`) for easy extension.

---

Happy modeling 🚀
