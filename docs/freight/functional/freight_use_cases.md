## Core Use Cases

### Chartering & Freight Booking

**Nominal scenario:**

  * Trader books a commodity trade requiring transportation.
  * Chartering desk books a **voyage charter**, **time charter**, or **CoA**.
  * System stores contract terms (rate, laycan, vessel type, cargo size).
  
**Edge cases:**

  * Vessel not available → re-negotiation.
  * Laycan missed → penalties or reallocation.
  * Wrong vessel type booked → operational risk.



### Voyage Operations

**Nominal scenario:**

  * Track vessel status, bunkering, port calls, ETA/ETD.
  * Update voyage progress and costs in the system.
  
* **Edge cases:**

  * Weather delays → ETA changes, congestion risk.
  * Vessel breakdown → voyage canceled, new vessel required.
  * Cargo contamination → insurance and claims handling.


### Demurrage & Claims

* **Nominal scenario:**

  * System calculates laytime allowed vs laytime used.
  * Generate demurrage or despatch invoice.
  
* **Edge cases:**

  * Port congestion → long delays → disputes.
  * Counterparty rejects demurrage calculation → claims process initiated.
  * Missing port logs → incomplete calculation.


### Freight Costing & Trade Linkage

* **Nominal scenario:**

  * Link freight costs to commodity trades (FOB → CIF).
  * Update delivered cost for PnL and arbitrage evaluation.
  
* **Edge cases:**

  * Incorrect linkage → miscalculated PnL.
  * Commodity trade canceled but freight contract still active → financial loss.
  * Freight cost higher than expected → arbitrage lost.


### Freight Derivatives (FFAs)

* **Nominal scenario:**

  * Hedge freight exposure with FFAs.
  * System links FFA positions with physical freight exposure.
  
* **Edge cases:**

  * Index mismatch (wrong Baltic route used).
  * Market illiquidity → unable to hedge.
  * Settlement disputes on FFA contract.


### Risk Management

* **Nominal scenario:**

  * Freight exposure (physical + FFAs) published to risk engine.
  * Daily MTM and VaR calculations include freight.
  
* **Edge cases:**

  * Data delays → exposure not updated in time.
  * Wrong mapping between vessel route and Baltic index.
  * Extreme freight volatility (e.g., 2020-2021 container crisis).


### Finance & Settlements

**Nominal scenario:**

  * Freight invoices generated and matched to charter contracts.
  * Demurrage/claims invoiced and settled.
  
* **Edge cases:**

  * Counterparty disputes → settlement delayed.
  * Wrong FX rate applied → financial misstatement.
  * Duplicate invoices → reconciliation needed.


### Integration with External Data

* **Nominal scenario:**

  * AIS feed provides vessel positions.
  * Baltic Exchange indices feed freight benchmarks.
  
* **Edge cases:**

  * Missing AIS signal → lost vessel tracking.
  * Index publication delayed → FFA settlement blocked.
  * Data vendor downtime → no updates.
