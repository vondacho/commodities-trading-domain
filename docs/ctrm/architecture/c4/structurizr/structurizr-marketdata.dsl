
workspace "CTRM - Market Data Service C3" {
    model {
        marketdata = container "Market Data Service" {
            technology "Java/Go"
            description "Feeds, curves, fallbacks"

            feedHandler = component "Feed Handler" {
                description "Ingests raw market data feeds"
            }
            priceNorm = component "Price Normalizer" {
                description "Cleans and standardizes prices"
            }
            curveBuilder = component "Curve Builder" {
                description "Builds forward curves and vol surfaces"
            }
            fallbackMgr = component "Fallback Manager" {
                description "Switches to backup feeds on outage"
            }

            feedHandler -> priceNorm "Provide cleaned ticks"
            priceNorm -> curveBuilder "Provide prices"
            feedHandler -> fallbackMgr "Detect outage"
            fallbackMgr -> priceNorm "Switch source"
        }
    }

    views {
        component marketdata {
            include *
            autolayout lr
        }
    }
}
