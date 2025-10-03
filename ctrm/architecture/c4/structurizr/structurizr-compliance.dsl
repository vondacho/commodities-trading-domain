
workspace "CTRM - Compliance Service C3" {
    model {
        compliance = container "Compliance Service" {
            technology "Python/Java"
            description "KYC/AML, surveillance, reporting"

            kycChecker = component "KYC Checker" {
                description "Collect docs, run AML screening"
            }
            sanctions = component "Sanctions Screening" {
                description "Cross-check against sanctions lists"
            }
            surveillance = component "Trade Surveillance" {
                description "Detect spoofing, layering, insider trading"
            }
            regReporting = component "Regulatory Reporting" {
                description "Generate reports for regulators"
            }

            kycChecker -> sanctions "Check parties"
            surveillance -> regReporting "Escalate suspicious cases"
        }
    }

    views {
        component compliance {
            include *
            autolayout lr
        }
    }
}
