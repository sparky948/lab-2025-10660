##############################################################################
# Solution: Benefits-App Entra Application Registration
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

  # SAML SSO configuration
  saml_single_sign_on = {
    identifier_uri = "urn:va:benefitsapp"
    reply_url      = "https://benefits.va.gov/sso/saml/consume"
    name_id_format = "emailAddress"
  }

  # Optional claims for SAML token
  optional_claims = {
    saml = [
      {
        name   = "uid"
        source = "employeeId"
      },
      {
        name   = "region"
        source = "extension_employeeRegion"
      },
      {
        name   = "level"
        source = "extension_authLevel"
      }
    ]
  }

  # Application Roles
  app_roles = [
    {
      display_name         = "BenefitsUser"
      description          = "Standard benefits user"
      value                = "BenefitsUser"
      allowed_member_types = ["User"]
    }
  ]

  # Example group assignments, if supported by the module
  assignments = {
    groups = [
      data.azuread_group.benefits_users.object_id
    ]
  }
}
