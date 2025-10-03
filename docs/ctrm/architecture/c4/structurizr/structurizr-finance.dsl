
workspace "CTRM - Finance Service C3" {
    model {
        finance = container "Finance Service" {
            technology "JVM/Python"
            description "Confirmations, invoices, settlements"

            confEngine = component "Confirmation Engine" {
                description "Match trades and generate confirmations"
            }
            invoiceGen = component "Invoice Generator" {
                description "Create invoices from deliveries/confirmations"
            }
            cashRecon = component "Cash Reconciliation" {
                description "Match payments vs invoices"
            }
            accounting = component "Accounting Integration" {
                description "Post to general ledger"
            }

            confEngine -> invoiceGen "Feed confirmed trades"
            invoiceGen -> cashRecon "Track payments"
            cashRecon -> accounting "Send accounting entries"
        }
    }

    views {
        component finance {
            include *
            autolayout lr
        }
    }
}
