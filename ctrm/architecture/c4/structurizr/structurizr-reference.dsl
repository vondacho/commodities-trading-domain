
workspace "CTRM - Reference Data Service C3" {
    model {
        refdata = container "Reference Data Service" {
            technology "Java/Python"
            description "Instruments, parties, calendars, units"

            instrCatalog = component "Instrument Catalog" {
                description "Defines tradable instruments and specs"
            }
            cpMaster = component "Counterparty Master" {
                description "Stores counterparty data and KYC flags"
            }
            calService = component "Calendar Service" {
                description "Trading days, holidays, settlement dates"
            }
            unitConv = component "Unit Conversion" {
                description "Converts measurement units (bbl→MT)"
            }

            instrCatalog -> cpMaster "Link contracts to parties"
            calService -> instrCatalog "Provide calendars"
            unitConv -> instrCatalog "Normalize units"
        }
    }

    views {
        component refdata {
            include *
            autolayout lr
        }
    }
}
