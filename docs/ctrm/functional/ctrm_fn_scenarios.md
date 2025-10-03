# Functional scenarios in Commodities Trading systems

## Trade Capture

```gherkin
Feature: Trade Capture
  As a trader
  I want to capture deals
  So that I can track positions and exposures

  Scenario: Capture a valid crude oil futures trade (nominal)
    Given I am logged in as a trader
    When I record "Buy 100 contracts of WTI Crude Oil Futures at $80 with Counterparty ABC"
    Then the trade should be saved
    And my position should reflect +100 contracts

  Scenario: Reject trade without counterparty (edge)
    Given I am entering a new trade
    When I omit counterparty details
    Then the system should reject the trade
    And display "Counterparty is required"
```

## Trade execution

```gherkin
Feature: Analytics & Decision Support
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
```

## Risk Management

```gherkin
Feature: Risk Management
  As a risk manager
  I want real-time monitoring of exposure and P&L
  So that I can prevent breaches of risk limits

  Scenario: Mark-to-market valuation (nominal)
    Given I hold 100 WTI futures bought at $80
    And the current price is $85
    When I run risk calculations
    Then my unrealized P&L should be $500,000

  Scenario: Credit limit breach (edge)
    Given Counterparty ABC has a credit limit of $10 million
    And current exposure is $9.5 million
    When I approve a $2 million trade
    Then the system should block the approval
    And alert "Credit limit exceeded"

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
```

## Logistics

```gherkin
Feature: Logistics & Operations
  As an operations manager
  I want to track delivery schedules and inventory
  So that physical trades are fulfilled correctly

  Scenario: Schedule shipment from storage (nominal)
    Given storage has 50,000 barrels of crude oil
    When I schedule a shipment of 20,000 barrels to Customer X
    Then inventory should reduce to 30,000 barrels
    And shipment status should be "Scheduled"

  Scenario: Prevent over-shipment (edge)
    Given storage has 5,000 tons of wheat
    When I attempt to ship 10,000 tons
    Then the system should reject the request
    And display "Insufficient inventory"

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
```

## Financing

```gherkin
Feature: Financing & Settlement
  Finance officers reconcile trades with banks and counterparties.

  Scenario: Settle LC-backed trade (nominal)
    Given a $5 million soybean shipment is backed by an LC
    When the bank confirms the LC
    And delivery is confirmed
    Then the trade status should be "Settled"
    And funds released to the producer

  Scenario: Flag expired LC (edge)
    Given a $2 million copper trade is backed by an LC
    And the LC expired yesterday
    When settlement is attempted
    Then the system should block settlement
    And display "Letter of Credit expired"
```

## Compliance

```gherkin
Feature: Compliance & Reporting
  As a compliance officer
  I want the system to detect suspicious trading behavior and enforce AML/KYC
  So that I can prevent market abuse and sanctions breaches

  Scenario: Generate EMIR report (nominal)
    Given a new derivatives trade is captured
    When I generate a daily EMIR report
    Then the trade should appear in the report
    And include counterparty LEI and UTI

  Scenario: Flag missing KYC (edge)
    Given I enter a trade with Counterparty XYZ
    And KYC is incomplete
    When I try to approve the trade
    Then the system should block approval
    And alert "KYC required"

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
```

## Analytics

```gherkin
Feature: Analytics & Decision Support
  Analysts forecast and simulate market outcomes.

  Scenario: Generate forward curve (nominal)
    Given I have price data for crude oil
    When I run forward curve generation
    Then the system should output forward prices
    And store them for risk and valuation

  Scenario: Stress test scenario (edge)
    Given I hold long positions in natural gas
    When I run a scenario with prices -30%
    Then the system should calculate P&L impact
    And show results in the risk dashboard
```

## Market data

```gherkin
Feature: Analytics & Decision Support
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
```

## Portfolio

```gherkin
Feature: Analytics & Decision Support
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
```

## Settlements

```gherkin
Feature: Analytics & Decision Support
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
```
