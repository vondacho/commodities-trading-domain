Feature: Settlements & Finance
  As a back-office clerk
  I want automated settlement workflows
  So that payments and reconciliations are efficient

  Scenario: Generate invoice for physical trade
    Given a physical trade of 2,000 barrels of oil is settled at $80/barrel
    When the trade is confirmed
    Then the system should generate an invoice of $160,000
    And send it to the counterparty for payment

  Scenario: Payment mismatch with counterparty
    Given an invoice of $160,000 was issued
    When the counterparty only pays $150,000
    Then the system should record a short payment
    And generate an exception report for dispute resolution

  Scenario: FX conversion error
    Given a settlement is in EUR
    And the internal system mistakenly applies USD rate
    When the mismatch is detected during reconciliation
    Then the system should adjust the accounting entry
    And notify finance of the correction
