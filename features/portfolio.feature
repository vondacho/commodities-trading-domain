Feature: Portfolio & P&L
  As a trader
  I want to see my current portfolio and P&L
  So that I can assess performance

  Scenario: View live portfolio P&L
    Given I have open positions in Gold and Silver futures
    When I open the "Portfolio Dashboard"
    Then I should see unrealized and realized P&L for each commodity
    And my aggregated net exposure across metals

  Scenario: Portfolio reconciliation failure
    Given I have open positions in Gold Futures
    And the clearing house reports a different quantity
    When the system compares internal vs external positions
    Then it should generate a reconciliation exception
    And assign it to the back office for investigation
