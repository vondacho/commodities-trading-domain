Feature: Physical Commodity Logistics
  As an operations manager
  I want to track delivery schedules and inventory
  So that physical trades are fulfilled correctly

  Scenario: Record shipment against contract
    Given a physical contract for 1,000 tons of Coffee is due this week
    When a shipment of 500 tons arrives at the port
    Then the system should record the partial delivery
    And update the inventory to reflect the received quantity

  Scenario: Shipment delayed due to weather
    Given a delivery contract specifies arrival by September 30
    When the shipment is delayed due to a storm at sea
    Then the system should update the expected delivery date
    And notify counterparties of the delay

  Scenario: Quality mismatch on physical delivery
    Given a contract specifies Coffee Grade A
    When the delivered batch contains 10% Grade B coffee
    Then the system should flag a quality dispute
    And trigger a workflow for claims and settlement adjustment
