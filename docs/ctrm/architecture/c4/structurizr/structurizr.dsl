
workspace "CTRM Platform" {

    !identifiers hierarchical
    model {
        user = person "Trader" {
            description "Places and manages orders, monitors P&L"
        }
        riskMgr = person "Risk Manager" {
            description "Monitors exposure, VaR, limits"
        }
        ops = person "Ops / Back Office" {
            description "Manages settlements, invoices, inventory"
        }
        compliance = person "Compliance Officer" {
            description "KYC/AML, surveillance, regulatory reports"
        }

        exchanges = softwareSystem "Exchanges/Brokers" {
            description "Order routing and execution"
            external true
        }
        mdp = softwareSystem "Market Data Providers" {
            description "Prices, curves, news, weather"
            external true
        }
        banks = softwareSystem "Banks/Clearing" {
            description "Payments, confirmations, margin"
            external true
        }
        counterparties = softwareSystem "Counterparties" {
            description "Trade confirmations and payments"
            external true
        }

        ctrm = softwareSystem "CTRM Platform" {
            trading = container "Trading Service" {
                technology "Java/Spring or Python/FastAPI"
                description "Order capture, routing, positions"
            }
            risk = container "Risk Service" {
                technology "JVM/Scala/Python"
                description "Exposure, VaR, stress testing"
            }
            finance = container "Finance Service" {
                technology "Java/Kotlin"
                description "Confirmations, invoicing, settlements"
            }
            logistics = container "Logistics Service" {
                technology "Java/Python"
                description "Shipments, inventory, quality"
            }
            complianceSvc = container "Compliance Service" {
                technology "Python/Java"
                description "KYC/AML, surveillance, reporting"
            }
            marketdata = container "Market Data Service" {
                technology "Java/Go"
                description "Feed handlers, curves, fallbacks"
            }
            reference = container "Reference Data Service" {
                technology "Java/Python"
                description "Instruments, parties, calendars"
            }
            iam = container "IAM Service" {
                technology "Keycloak/Auth0"
                description "Users, roles, approvals"
            }
        }

        ' Relationships
        user -> ctrm.trading "Place/cancel orders, view positions"
        riskMgr -> ctrm.risk "Set limits, view exposure"
        ops -> ctrm.finance "Settle, invoice, reconcile"
        ops -> ctrm.logistics "Track shipments, inventory"
        compliance -> ctrm.complianceSvc "Run KYC/AML, monitor abuse"

        ctrm.trading -> exchanges "Route orders / receive fills"
        ctrm.marketdata -> mdp "Ingest prices & curves"
        ctrm.finance -> banks "Payments, confirmations"
        ctrm.finance -> counterparties "Invoices & confirmations"

        ctrm.trading -> ctrm.risk "Trades/positions → limits check"
        ctrm.trading -> ctrm.finance "Trades → settlement; confirms ←"
        ctrm.logistics -> ctrm.finance "Delivery basis → invoice"
        ctrm.reference -> ctrm.trading "Reference/master data"
        ctrm.iam -> ctrm.trading "AuthN/Z"
    }

    views {
        systemContext ctrm {
            include *
            autolayout lr
        }

        container ctrm {
            include *
            autolayout lr
        }

        theme default
    }

    documentation {
        adr "001-architecture-overview" "Architecture Overview" "The CTRM Platform follows a DDD and event-driven design. Core bounded contexts: Trading, Risk, Finance, Logistics, Compliance, Market Data, Reference, IAM."

        section "System Context" {
            format markdown
            content "C1 shows users, external systems, and the CTRM platform."
        }

        section "Containers" {
            format markdown
            content "C2 shows internal services, databases, and event backbone (Kafka)."
        }

        section "Components" {
            format markdown
            content "C3 diagrams available per bounded context (Trading, Risk, Finance, Logistics, Compliance, Market Data, Reference, IAM)."
        }
    }
}
