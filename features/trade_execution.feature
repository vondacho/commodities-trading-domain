Feature: Trade Execution & Order Management
  As a trader
  I want to place and manage commodity orders
  So that I can execute my trading strategies

  Scenario: Place a futures contract order
    Given I want to buy 100 lots of Wheat Futures for December delivery
    When I submit the order at a limit price of $6.50
    Then the order should be routed to the appropriate exchange
    And I should see the order status as "Pending"

  Scenario: Track partial fills
    Given I have an open order of 50 lots of Copper Futures
    When 20 lots are filled by the exchange
    Then the system should update my position to reflect 20 filled
    And keep the remaining 30 as open

  Scenario: Order rejected by exchange
    Given I submit a buy order for 1,000 lots of Natural Gas Futures
    When the exchange rejects the order due to insufficient margin
    Then the system should notify me with the rejection reason
    And mark the order as "Rejected"

  Scenario: Duplicate order prevention
    Given I have already submitted a buy order for 100 Wheat Futures
    When I accidentally submit the same order again
    Then the system should detect the duplicate
    And prompt me to confirm or cancel the second order
