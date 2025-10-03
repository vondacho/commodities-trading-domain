# Sagas in CTRM systems

**Sagas** are especially relevant in **commodities trading systems**, where workflows span across multiple bounded contexts (Trade, Risk, Logistics, Settlement, Compliance) and no single transaction can cover them all.


## What is a Saga?

A **Saga** is a **long-running business process** that coordinates a series of local transactions across multiple services/contexts.

Instead of a global transaction (which is impractical in microservices), each local step commits independently.

If something fails, the Saga issues **compensating actions** to undo previous steps.

## Saga Execution Models

### Choreography (Event-driven)
Each service listens to events and reacts. There is no central controller.
  
* Example: `TradeCaptured` → triggers Risk, Settlement, Logistics independently.
  
### Orchestration (Central controller)
A Saga orchestrator like a workflow engine drives the sequence.

* Example: A `SettlementSaga` service tells Risk → Bank → Compliance what to do, step by step.

## Why Sagas Matter in Commodities Trading

Trading workflows are **cross-cutting**:

* **Trade Lifecycle**: Capture trade → validate credit → hedge exposure → confirm settlement.

* **Physical Delivery**: Confirm trade → schedule shipment → update inventory → generate bill of lading → trigger compliance reporting.

* **Settlement**: Validate LC → confirm delivery → release payment → generate audit log.

These can’t be wrapped in one database transaction — they need a **Saga**.

## Saga Example: Settlement Flow

### Nominal Flow

1. **Trade Capture Service** → emits `TradeConfirmed`.
2. **Risk Service** → checks exposure.
3. **Settlement Service** → requests Letter of Credit validation.
4. **Logistics Service** → confirms delivery.
5. **Settlement Service** → releases payment.
6. **Compliance Service** → generates regulatory report.

### Compensation (if LC expired)

* If `LetterOfCreditInvalid`, then:

  * Settlement Service cancels payment.
  * Logistics Service marks shipment as “on hold.”
  * Trade Service flags trade as “Unsettled.”



## Saga in PlantUML (Event-driven Choreography)

```plantuml
@startuml SettlementSaga
title Settlement Saga - Choreography

[Trade Service] -> [Risk Service] : TradeConfirmed
[Risk Service] -> [Settlement Service] : ExposureValidated
[Settlement Service] -> [Bank Service] : LCValidationRequested
[Bank Service] -> [Settlement Service] : LCValid
[Settlement Service] -> [Logistics Service] : DeliveryConfirmed
[Settlement Service] -> [Compliance Service] : PaymentSettled

== Compensation Flow ==
[Bank Service] -> [Settlement Service] : LCInvalid
[Settlement Service] -> [Logistics Service] : HoldShipment
[Settlement Service] -> [Trade Service] : FlagTradeUnsettled

@enduml
```



## Design Considerations

* **Idempotency**: Saga steps should tolerate retries.
* **Event Sourcing**: Keep full log of saga state.
* **Timeouts**: Some steps (LC approval) may take days → sagas are long-lived.
* **Monitoring**: Track saga status to avoid “lost” processes.
* **Tools**: Workflow engines (Camunda, Temporal, Axon) help orchestrate sagas.



## Summary

* **Sagas** = coordination of distributed transactions across bounded contexts.
* Critical for **trade lifecycle, settlement, logistics workflows** in CTRM systems.
* Two styles: **choreography (events)** vs **orchestration (central saga manager)**.
* Support **compensation, retries, timeouts, monitoring**.

