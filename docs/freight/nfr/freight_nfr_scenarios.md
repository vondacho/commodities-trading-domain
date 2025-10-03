# Non-functional scenarios

## Performance

```gherkin
Feature: System Performance and Scalability
  As a system architect
  I want the freight system to process high data volumes
  So that traders and risk managers get timely updates

  Scenario: Handle high-frequency vessel tracking feed
    Given the system is receiving 1 million AIS messages per hour
    When the data is processed
    Then all vessel positions should be updated within 1 minute
    And no more than 0.1% of messages should be lost

  Scenario: Process freight indices in real-time
    Given Baltic Exchange publishes a new index
    When the system receives it
    Then the FFA MTM calculations should be updated within 5 seconds
```

## Availability

```gherkin
Feature: System Availability and Reliability
  As an operations manager
  I want the system to be highly available
  So that freight booking and monitoring are uninterrupted

  Scenario: Failover in case of node outage
    Given the system is running in a clustered deployment
    When one node fails
    Then the system should continue operating without downtime
    And all users should remain connected

  Scenario: Disaster recovery
    Given the primary data center is unavailable
    When the disaster recovery site is activated
    Then the system should be restored within 1 hour
    And no more than 15 minutes of data should be lost
```

## Data Integrity

```gherkin
Feature: Data Consistency and Integrity
  As a finance user
  I want freight data to remain consistent
  So that invoices and PnL are correct

  Scenario: Consistent freight contract linkage
    Given a commodity trade is linked to a charter party
    When the freight cost is updated
    Then the delivered PnL in trading and risk systems should be updated consistently

  Scenario: Idempotent freight update events
    Given a freight update event is published twice
    When it is consumed by the finance system
    Then the freight cost should only be applied once

```

## Security & Compliance

```gherkin
Feature: Security and Compliance
  As a compliance officer
  I want all freight operations to be secure and auditable
  So that we meet regulatory obligations

  Scenario: Role-based access
    Given a user is from the risk department
    When they try to modify a charter party
    Then the system should deny access

  Scenario: Audit trail for demurrage disputes
    Given a demurrage claim is modified
    When the claim is saved
    Then the system should log the change
    And record the user, timestamp, and old vs new values

```

## Monitoring & Observability

```gherkin
Feature: Monitoring and Observability
  As a support engineer
  I want to monitor system health
  So that I can detect issues quickly

  Scenario: Alert for missing freight index
    Given the system expects a Baltic Exchange update every day
    When no update is received within 24 hours
    Then the system should raise an alert

  Scenario: Alert for abnormal latency
    Given the average API response time is below 500ms
    When response time exceeds 2 seconds for 5 minutes
    Then the system should raise a performance alert

```

