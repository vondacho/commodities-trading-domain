# Key NFRs for Freight Systems

### Performance & Scalability

* Handle **real-time vessel tracking feeds** (AIS data, often millions of messages per day).
* Process **market data** (Baltic Exchange indices) with low latency for FFA settlements.
* Support **high-frequency trade bookings** and exposure calculations.
* Scale horizontally to handle peak volatility periods (e.g., shipping crises, sanctions news).



### Availability & Reliability

* Near **24/7 availability** (global trading desks operate across time zones).
* **Failover and disaster recovery** in case of outages (RPO < 15 min, RTO < 1 hr).
* Ensure **no single point of failure** in trade capture or freight cost linkage.



### Data Consistency & Integrity

* Freight contracts, voyages, and invoices must be **consistent** across Trading, Risk, and Finance.
* **Strong transactional integrity** for freight settlement (no double payments).
* **Event-driven updates** (trades → freight → risk → finance) must be idempotent.



### Security & Compliance

* Role-based access control (e.g., chartering desk vs finance vs risk).
* **Audit trail** for contract changes, invoices, demurrage disputes.
* Compliance with **regulatory audits** (SOX, IFRS, shipping regulations, sanctions screening for vessels and counterparties).
* Secure integration with **external providers** (Baltic, AIS).



### Interoperability & Integration

* Integrate with **Trading (ETRM)**, **Risk Engine**, **Finance ERP**, and **external data feeds**.
* **API-first architecture** (REST/GraphQL) + **event-driven messaging** (Kafka, MQ).
* Support for **industry formats** (XML, FIX, JSON) for freight contracts & settlements.



### Usability & Transparency

* Clear visualization of **voyage progress**, **laytime**, **demurrage calculations**.
* Dashboards for **freight exposure** (linked physical & FFA positions).
* Drill-down to **port logs, vessel events, index history** for disputes.



### Auditability & Traceability

* Every **freight cost element** (charter hire, bunker, port charges, demurrage) must be traceable.
* All **FFA settlements** should be reproducible against Baltic indices.
* Maintain **immutable history** of contract negotiations and changes.



### Extensibility & Maintainability

* Ability to **add new vessel types or indices** without major rework.
* Modular architecture so **Freight Derivatives, Chartering, Demurrage** can evolve independently.
* Automated testing for critical calculation logic (e.g., laytime, FFA MTM).



### Monitoring & Observability

* Monitor **voyage execution KPIs** (ETA deviation, bunker consumption).
* Monitor system health (API latencies, message queues, data freshness).
* Real-time alerts for **missed feeds** (e.g., Baltic index not updated).
