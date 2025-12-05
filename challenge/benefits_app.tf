
---

## 🧱 `challenge/benefits_app.tf` (starter for candidates)

```hcl
##############################################################################
# Application Registration: Benefits-App
# Starter Terraform file for candidate challenge
##############################################################################

module "benefits_app" {
  source = "../../terraform-modules/app-registration"

  display_name                  = "Benefits-App"
  description                   = "Benefits app migrated from legacy SSO"
  sign_in_audience              = "AzureADMyOrg"
  preferred_single_sign_on_mode = "saml"
  graph_api_bearer_token        = var.graph_api_bearer_token

  application_owners = [
    "john.powell@va.gov"
  ]

  # TODO: Configure SAML SSO settings (identifier, reply URL, NameID format)
  # TODO: Configure optional claims (uid, region, level)
  # TODO: Configure app roles (BenefitsUser)
  # TODO: Configure any assignments if your module supports them
}
