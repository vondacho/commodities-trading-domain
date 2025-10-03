
workspace "CTRM - Trading Service C3" {
    model {
        trading = container "Trading Service" {
            technology "JVM/Python"
            description "Orders, trades, positions"

            orderApi = component "Order API" {
                technology "REST/GraphQL"
                description "Place/amend/cancel orders"
            }
            sor = component "Smart Order Router" {
                description "Routes to venues based on rules"
            }
            execListener = component "Execution Listener" {
                description "Captures fills from venues"
            }
            positionEngine = component "Position Engine" {
                description "Netting, average price, lifecycle"
            }
            dupGuard = component "Duplicate Guard" {
                description "Detects duplicate submissions"
            }
            preTrade = component "Pre-Trade Risk Adapter" {
                description "Checks limits with Risk service"
            }
            mdAdapter = component "Market Data Adapter" {
                description "Provides pricing & curves"
            }

            orderApi -> dupGuard "Check"
            orderApi -> preTrade "Check limits"
            orderApi -> sor "Route order"
            execListener -> positionEngine "Update positions"
            positionEngine -> orderApi "Expose positions"
            mdAdapter -> orderApi "Provide prices"
        }
    }

    views {
        component trading {
            include *
            autolayout lr
        }
    }
}
