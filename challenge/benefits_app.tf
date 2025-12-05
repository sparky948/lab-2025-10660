# =============================================================================
# Task: version 1
# Extend this block live to include:
#
# - saml_single_sign_on block
# - reply_urls
# - optional_claims for SAML token
# - Directory extension mapping
# - app_roles block
# =============================================================================

module "finance_app" {
  source = "../../terraform-modules/app-registration"

  display_name                  = "Finance-App"
  description                   = "Finance application migrated from SiteMinder"
  sign_in_audience              = "AzureADMyOrg"
  graph_api_bearer_token        = var.graph_api_bearer_token

  application_owners = [
    "john.powell@va.gov"
  ]
}
