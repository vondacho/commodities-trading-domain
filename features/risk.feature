Feature: Risk Monitoring
  As a risk manager
  I want real-time monitoring of exposure
  So that I can prevent breaches of risk limits

  Scenario: Exposure alert for crude oil
    Given the exposure limit for Crude Oil is 10,000 barrels
    And the trader’s current exposure is 9,800 barrels
    When the trader places a new buy order for 500 barrels
    Then the system should block the order
    And raise an alert "Exposure limit exceeded"

  Scenario: Intraday risk limit breach due to volatility
    Given the trader’s risk limit is $1,000,000 VaR
    And the current VaR is $950,000
    When oil prices drop by 10% in one hour
    Then the system should flag that the VaR has exceeded the limit
    And automatically notify the risk manager

  Scenario: Hedge effectiveness check
    Given a trader is long 1,000 tons of Aluminum spot
    And short 10 Aluminum Futures contracts
    When the futures price diverges from the spot price significantly
    Then the system should flag the hedge as ineffective
