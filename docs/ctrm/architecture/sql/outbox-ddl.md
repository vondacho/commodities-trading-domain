# Outboxing

```sql
-- Generic Outbox table for the outbox pattern
CREATE TABLE IF NOT EXISTS outbox_events (
  id UUID PRIMARY KEY,
  aggregate_type VARCHAR(120) NOT NULL,
  aggregate_id VARCHAR(120) NOT NULL,
  event_type VARCHAR(120) NOT NULL,
  payload JSONB NOT NULL,
  headers JSONB NOT NULL DEFAULT '{}'::jsonb,
  occurred_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
  published_at TIMESTAMP WITH TIME ZONE,
  partition_key VARCHAR(256),
  UNIQUE (aggregate_type, id)
);

-- Index for polling publishers
CREATE INDEX IF NOT EXISTS idx_outbox_published_null ON outbox_events (published_at) WHERE published_at IS NULL;
CREATE INDEX IF NOT EXISTS idx_outbox_occurred_at ON outbox_events (occurred_at);

-- Example: Debezium/CDC will publish events to Kafka by capturing inserts/updates here.
```