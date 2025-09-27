# Context Map (Mermaid)

```mermaid
flowchart LR
  MD[Market Data] -->|ACL| TR[Trading]
  RD[Reference Data] -->|Published Language| TR
  TR -->|Customer/Supplier| RK[Risk]
  TR -->|Customer/Supplier + Shared Kernel (Trade schema)| FN[Finance]
  TR -->|Customer/Supplier + ACL| LG[Physical Logistics]
  LG -->|Conformist (delivery→invoice)| FN
  TR --> CM[Compliance]
  CM --- TR
  IAM[IAM] --> TR
  RD --> RK
  RD --> FN
  RD --> LG
```