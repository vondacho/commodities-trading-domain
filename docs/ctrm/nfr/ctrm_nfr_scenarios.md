# Non-functional scenarios in Commodities Trading systems

## Performance

```gherkin
Feature: Performance & Scalability
  The system must handle high trading volumes with low latency.

  Scenario: Process trades under latency threshold (nominal)
    Given the system receives 10,000 trades in one minute
    When trades are captured and positions updated
    Then each trade should be processed in under 200 milliseconds
    And no trades should be dropped

  Scenario: Graceful degradation at peak load (edge)
    Given the system receives 100,000 trades in one minute
    When load exceeds normal thresholds
    Then the system should queue excess trades
    And alert operations with "High load"
    And continue processing without crashing
```

## Availability

```gherkin
Feature: Availability & Reliability
  The system must be continuously available with disaster recovery.

  Scenario: High availability uptime (nominal)
    Given the system is running
    When I monitor uptime over one month
    Then availability should be at least 99.9%

  Scenario: Failover to disaster recovery site (edge)
    Given the primary data center is unavailable
    When a disaster is declared
    Then the system should failover to the backup site
    And recovery time objective should be under 1 hour
```

## Security

```gherkin
Feature: Security
  The system must enforce authentication, authorization, and encryption.

  Scenario: Role-based access control (nominal)
    Given I am logged in as a risk manager
    When I attempt to view trade details
    Then I should be allowed
    But when I attempt to approve a settlement
    Then I should be denied

  Scenario: Encryption enforcement (edge)
    Given I send data between client and server
    When I inspect the connection
    Then traffic should be encrypted with TLS 1.2 or higher
```

## Data Integrity

```gherkin
Feature: Data Integrity & Consistency
  The system must ensure accurate trade records.

  Scenario: Prevent duplicate trade IDs (nominal)
    Given a trade with ID "TR123" is recorded
    When I try to enter another trade with ID "TR123"
    Then the system should reject it
    And display "Duplicate trade ID not allowed"

  Scenario: Ensure reconciliation with external systems (edge)
    Given I reconcile trades with exchange reports
    When discrepancies are found
    Then the system should flag mismatches
    And generate an exception report
```

## Compliance

```gherkin
Feature: Compliance & Auditability
  The system must meet regulatory requirements.

  Scenario: Regulatory report generation (nominal)
    Given I have captured a derivatives trade
    When I generate the EMIR daily report
    Then the trade should appear with counterparty LEI and UTI

  Scenario: Complete audit trail (edge)
    Given a trader edits a trade after capture
    When I view the audit log
    Then the system should show who made the change
    And when it was made
    And what was changed
```

## Maintainability

```gherkin
Feature: Maintainability & Extensibility
  The system should support upgrades and modular expansion.

  Scenario: Zero-downtime upgrade (nominal)
    Given the system is in production
    When a patch release is applied
    Then users should remain logged in
    And trades should continue to be processed

  Scenario: Add new commodity type without redeployment (edge)
    Given the system currently supports crude oil and copper
    When I configure "wheat" as a new commodity
    Then I should be able to capture wheat trades
    Without restarting the system
```

