Feature: Market Data Access
  As a trader
  I want to view real-time and historical commodity prices
  So that I can make informed trading decisions

  Scenario: View real-time futures price
    Given I am logged into the trading system
    When I select "Crude Oil Futures" for today's date
    Then I should see the current bid/ask prices and market depth

  Scenario: Analyze historical price trends
    Given I have access to historical data
    When I request the last 12 months of Gold prices
    Then the system should display a chart with daily closing prices

  Scenario: Missing market data feed
    Given I rely on Bloomberg as my primary data source
    When the Bloomberg feed is unavailable
    Then the system should automatically switch to Refinitiv as backup
    And notify the trader that fallback data is being used
