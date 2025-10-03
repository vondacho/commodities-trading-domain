# Functional scenarios in Freight systems

## Chartering & Freight Booking

```gherkin
Feature: Chartering and Freight Booking
  As a chartering manager
  I want to capture voyage, time, and CoA charters
  So that freight is linked correctly to commodity trades

  Scenario: Book a voyage charter successfully
    Given a commodity trade requiring transport
    When I create a voyage charter with vessel, laycan, and freight rate
    Then the charter should be linked to the trade
    And the freight cost should appear in delivered PnL

  Scenario: Vessel not available
    Given a charter request for a vessel
    When the vessel is already booked
    Then the system should notify me of unavailability
    And suggest alternative vessels or dates

  Scenario: Laycan missed
    Given a voyage charter with a fixed laycan
    When the vessel arrives after the laycan period
    Then the system should record a laycan breach
    And notify operations for renegotiation

```

## Voyage Operations

```gherkin
Feature: Voyage Operations
  As an operations manager
  I want to track vessel voyages
  So that I can monitor cargo delivery and costs

  Scenario: Update voyage progress
    Given a voyage is active
    When I update the vessel ETA and port status
    Then the voyage record should be updated
    And new costs (bunkers, port charges) should be reflected

  Scenario: Weather delay
    Given a vessel is en route
    When weather causes a delay of more than 24 hours
    Then the system should update ETA
    And notify trading and risk of possible exposure changes

  Scenario: Vessel breakdown
    Given a voyage charter is active
    When the vessel breaks down
    Then the voyage status should be marked as canceled
    And a replacement charter request should be created

```

## Demurrage & Claims

```gherkin
Feature: Demurrage and Claims
  As an operations/finance user
  I want to calculate demurrage
  So that I can settle claims correctly

  Scenario: Demurrage calculated correctly
    Given a voyage charter with laytime of 72 hours
    And actual laytime used is 96 hours
    When the system calculates demurrage
    Then it should generate a demurrage invoice for 24 hours

  Scenario: Despatch payment
    Given a voyage charter with laytime of 72 hours
    And actual laytime used is 60 hours
    When the system calculates demurrage
    Then it should generate a despatch payment for 12 hours

  Scenario: Port logs missing
    Given a demurrage calculation requires port logs
    When port logs are not available
    Then the system should flag the calculation as incomplete
    And request missing documents from counterparties
```

## Freight Derivatives (FFAs)

```gherkin
Feature: Freight Derivatives (FFAs)
  As a risk manager
  I want to hedge freight exposure with FFAs
  So that I can manage freight cost volatility

  Scenario: Create an FFA hedge
    Given a voyage exposure on Baltic route C3
    When I book an FFA contract on route C3 for equivalent lots
    Then the system should link the FFA contract to the voyage exposure
    And reduce net exposure accordingly

  Scenario: Wrong index used
    Given an exposure on Baltic route C3
    When an FFA is booked on route C5
    Then the system should warn me of a mismatch
    And prevent incorrect linkage

  Scenario: Illiquid market
    Given a need to hedge exposure
    When no counterparties are quoting FFAs
    Then the system should record the hedge request as pending
    And notify the trader of market illiquidity
```

## Finance & Settlements

```gherkin
Feature: Freight Finance and Settlements
  As a finance user
  I want to process freight invoices and demurrage claims
  So that settlements are accurate

  Scenario: Settle freight invoice
    Given a freight invoice is received
    When I validate it against the charter terms
    Then the invoice should be marked as approved
    And settlement instructions should be generated

  Scenario: Duplicate invoice
    Given a freight invoice is received
    When an identical invoice already exists in the system
    Then the system should reject the duplicate
    And notify finance of the discrepancy

  Scenario: FX mismatch
    Given a freight invoice in USD
    When the system applies the wrong FX rate
    Then it should flag the settlement as incorrect
    And request correction before payment
```
