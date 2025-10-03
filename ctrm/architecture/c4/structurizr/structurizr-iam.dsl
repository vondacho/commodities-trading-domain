
workspace "CTRM - IAM Service C3" {
    model {
        iam = container "IAM Service" {
            technology "Keycloak/Auth0"
            description "Users, roles, entitlements, approvals"

            userDir = component "User Directory" {
                description "Stores user identities"
            }
            roleMgr = component "Role Manager" {
                description "Assigns roles to users"
            }
            entitlementChk = component "Entitlement Checker" {
                description "Evaluates permissions on actions"
            }
            approvalWf = component "Approval Workflow" {
                description "Handles 4-eyes approvals"
            }

            userDir -> roleMgr "Assign roles"
            roleMgr -> entitlementChk "Feed role-permissions"
            approvalWf -> entitlementChk "Override approvals"
        }
    }

    views {
        component iam {
            include *
            autolayout lr
        }
    }
}
