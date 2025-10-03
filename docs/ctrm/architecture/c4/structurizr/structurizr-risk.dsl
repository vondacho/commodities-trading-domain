
workspace "CTRM - Risk Service C3" {
    model {
        risk = container "Risk Service" {
            technology "JVM/Python"
            description "Exposure, VaR, limits"

            limitManager = component "Limit Manager" {
                description "Defines and enforces limits"
            }
            exposureCalc = component "Exposure Calculator" {
                description "Aggregates positions & sensitivities"
            }
            varEngine = component "VaR Engine" {
                description "Historical/simulated VaR"
            }
            stressTester = component "Stress Tester" {
                description "What-if scenario engine"
            }
            curveAdapter = component "Curve Adapter" {
                description "Pulls curves/prices"
            }

            exposureCalc -> limitManager "Feeds exposure"
            varEngine -> limitManager "Provides risk metrics"
            stressTester -> limitManager "Scenario results"
            curveAdapter -> exposureCalc "Valuation inputs"
        }
    }

    views {
        component risk {
            include *
            autolayout lr
        }
    }
}
