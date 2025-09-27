# Architecture Decisions (ADR) – Highlights

1. **Event-Driven Backbone**: Use Kafka/Pulsar with outbox pattern; guarantee at-least-once; consumers idempotent.
2. **Consistency**: Strong within aggregates; eventual across contexts; sagas for long-running flows.
3. **Market Data Fallbacks**: Primary/backup sources with circuit breakers and clear operator feedback.
4. **Auditability**: Immutable event logs; append-only per aggregate; time-travel debugging.
5. **Observability**: Trace IDs across events; metrics for latency, retries, backlog; dead-letter queues managed.