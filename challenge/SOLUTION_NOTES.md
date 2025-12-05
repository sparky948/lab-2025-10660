# Solution Notes – Benefits-App

## Key Points

- `saml_single_sign_on` configures identifier, reply URL, and NameID format.
- `optional_claims.saml` adds custom claims to SAML tokens:
  - `uid` from `employeeId`
  - `region` from `extension_employeeRegion`
  - `level` from `extension_authLevel`
- `app_roles` defines "BenefitsUser" as a user role.
- `terracurl_request` resource patches `api.acceptMappedClaims = true` using Graph API.

## Evaluation Hints

Strong candidates will:

- Use structurally valid HCL.
- Show clear understanding of SAML vs claims vs app roles.
- Think about ordering (using `depends_on`).
- Understand why `acceptMappedClaims` is needed for mapped/extension claims.
