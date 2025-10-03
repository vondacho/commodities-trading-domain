# Freight in Commodities Trading


## C4 Container View

```plantuml
@startuml
!include <C4/C4_Container>

LAYOUT_LEFT_RIGHT()

Person(trader, "Trader")
Person(riskMgr, "Risk Manager")
Person(ops, "Operations")
Person(finance, "Finance")

System_Boundary(domain, "Commodities Trading Domain") {
  Container(tradingSys, "Trading System (ETRM)", "Application")
  Container(freightSys, "Freight Management System", "Application")
  Container(riskSys, "Risk Engine", "Application")
  Container(financeSys, "Finance & Settlements", "Application")
  Container_Ext(baltic, "Baltic Exchange", "External Service")
  Container_Ext(ais, "AIS / Vessel Tracking", "External Service")
}

Rel(trader, tradingSys, "Books trades")
Rel(trader, freightSys, "Books freight contracts, FFAs")
Rel(riskMgr, riskSys, "Monitors exposures")
Rel(ops, freightSys, "Executes voyages, monitors delays")
Rel(finance, financeSys, "Processes invoices")

Rel(tradingSys, freightSys, "Links trades with freight contracts")
Rel(freightSys, riskSys, "Publishes freight exposures")
Rel(tradingSys, riskSys, "Publishes commodity exposures")
Rel(financeSys, freightSys, "Settlements, demurrage invoices")
Rel(freightSys, baltic, "Fetches freight indices")
Rel(freightSys, ais, "Fetches vessel positions")
@enduml
```



## Deployment View

```plantuml
@startuml
!include <C4/C4_Deployment>

Deployment_Node(cloud, "Cloud Platform", "AWS/Azure") {
  Deployment_Node(appTier, "Application Tier", "Kubernetes Cluster") {
    ContainerInstance(tradingSvc, "Trading System (ETRM)", "Service")
    ContainerInstance(freightSvc, "Freight Management", "Service")
    ContainerInstance(riskSvc, "Risk Engine", "Service")
    ContainerInstance(financeSvc, "Finance & Settlements", "Service")
  }
  Deployment_Node(dataTier, "Databases", "Managed SQL + NoSQL") {
    ContainerInstance(tradingDb, "Trading DB", "Relational DB")
    ContainerInstance(freightDb, "Freight DB", "Relational DB")
    ContainerInstance(riskDb, "Risk DB", "Time-Series DB")
    ContainerInstance(financeDb, "Finance DB", "Relational DB")
  }
  Deployment_Node(integration, "Integration Layer", "Kafka / APIs") {
    ContainerInstance(eventBus, "Event Bus", "Kafka/MQ")
    ContainerInstance(apiGw, "API Gateway", "REST/GraphQL")
  }
}

Deployment_Node(external, "External Providers", "Internet") {
  ContainerInstance(baltic, "Baltic Exchange API", "External")
  ContainerInstance(ais, "AIS Vessel Tracking", "External")
}
@enduml
```



## Data Flow View

```plantuml
@startuml
!include <C4/C4_Dynamic>

title Data Flow: Commodity Trade → Freight → Risk → Finance

Person(trader, "Trader")
Person(riskMgr, "Risk Manager")
Person(financeUser, "Finance")

System(tradingSys, "Trading System (ETRM)")
System(freightSys, "Freight Management System")
System(riskSys, "Risk Engine")
System(financeSys, "Finance & Settlements")
System_Ext(baltic, "Baltic Exchange API")
System_Ext(ais, "AIS Vessel Tracking")

trader -> tradingSys : 1. Book trade (FOB/CIF)
tradingSys -> freightSys : 2. Publish trade event (shipment details)
freightSys -> freightSys : 3. Create CharterParty & Voyage
freightSys -> baltic : 4. Fetch freight index
freightSys -> ais : 5. Fetch vessel position/ETA
freightSys -> tradingSys : 6. Link CharterParty to Trade
freightSys -> riskSys : 7. Publish freight exposure & MTM
riskSys -> riskMgr : 8. Update exposures, VaR
freightSys -> financeSys : 9. Send freight invoices & claims
financeSys -> financeUser : 10. Settlement & GL posting
@enduml
```



## Conclusion

Freight is both an **operational** and **financial** domain in commodities trading.  
It requires tight **integration with Trading, Risk, and Finance**, real-time **data feeds** (AIS, Baltic Exchange), and strong **event-driven architecture** for accurate PnL and exposure management.
