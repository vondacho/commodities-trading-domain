
workspace "CTRM - Logistics Service C3" {
    model {
        logistics = container "Logistics Service" {
            technology "Java/Python"
            description "Shipments, inventory, quality"

            contractMgr = component "Contract Manager" {
                description "Capture and manage physical contracts"
            }
            shipTracker = component "Shipment Tracker" {
                description "Track shipments, ETAs, transport"
            }
            inventoryMgr = component "Inventory Manager" {
                description "Manage stock in warehouses/tanks"
            }
            qualityCtrl = component "Quality Control" {
                description "Record inspections, disputes"
            }

            contractMgr -> shipTracker "Schedules shipments"
            shipTracker -> inventoryMgr "Update stock on arrivals"
            qualityCtrl -> inventoryMgr "Adjust lots on disputes"
        }
    }

    views {
        component logistics {
            include *
            autolayout lr
        }
    }
}
