Feature: Compliance & Surveillance
  As a compliance officer
  I want the system to detect suspicious trading behavior and enforce AML/KYC
  So that I can prevent market abuse and sanctions breaches

  Scenario: Detect spoofing pattern
    Given a trader places 10 large buy orders and cancels them quickly
    When the system analyzes the order history
    Then it should flag this behavior as potential "Spoofing"
    And generate a compliance alert

  Scenario: AML red flag for counterparty
    Given I attempt to trade with a new counterparty
    When the KYC check shows they are on a sanctions list
    Then the system should block the trade
    And escalate to compliance for review

  Scenario: Failed regulatory submission
    Given I am required to report daily trades to the regulator
    When the submission file fails to transmit
    Then the system should retry automatically
    And if still unsuccessful, alert compliance within 1 hour
