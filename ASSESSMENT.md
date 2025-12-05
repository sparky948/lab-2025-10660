# Entra ID SSO Migration – Technical Assessment

This hands-on challenge simulates real work performed in your role as a **Lead Technical Integration Engineer** supporting Entra ID SSO modernization.  
You will configure identity integrations, design migration patterns, write Terraform, and troubleshoot SAML issues.

---

# 📌 Prerequisites for the Live Session

Before joining the assessment, ensure you have:

- Ability to **share your screen** in Microsoft Teams  
- A code editor (**VS Code recommended**)  
- Terraform installed (`terraform -version`)  
- A modern browser with developer tools (Chrome/Edge)  
- PowerShell available (for the fake token script)  
- The challenge repository downloaded:

https://github.com/sparky948/lab-2025-10660/tree/feature/solution-sample


You will primarily use:
challenge/benefits_app.tf
challenge/claims.json
tools/Set-FakeGraphToken.ps1

## Exercise 1 – Configure a SAML App in Entra Portal (Hands-On)

Goal: Validate your ability to configure a SAML app and map claims correctly.

FinanceApp Requirements
Setting	Value
Identifier (Entity ID)	urn:va:financeapp
Reply URL (ACS)	https://finance-app.gov/saml/consume
NameID Format	Email address
Required Claims
Claim	Source
uid	employeeId
region	extension_employeeRegion
Group Claim	Security groups only
Task

In the Entra portal:

Create an Enterprise Application

Configure SAML SSO

Set Identifier, Reply URL, NameID format

Add uid + region claims

Add a group claim filtered to security groups

## 🧩 Exercise 2 – Header-Based SSO Migration (App Proxy)

Goal: Evaluate your ability to migrate legacy SiteMinder applications.

Scenario

LegacyReports currently receives:

SM_USER: <user UPN>


It cannot be modified to support SAML/OIDC.

## Task

Design a migration using Entra Application Proxy.

Expected concepts:

User → Entra ID → App Proxy Pre-Auth → Connector → App

Header injection (SM_USER)

Claim mapping

Conditional Access enforcement

TLS termination and security considerations

Provide a diagram or verbal walkthrough using: https://www.drawio.com/

## 🧩 Exercise 3 – Terraform SAML Configuration

Open:

challenge/benefits_app.tf


And implement:

saml_single_sign_on block

optional_claims.saml (uid, region, level)

app_roles → BenefitsUser

Group assignments

## 🧩 Exercise 4 – Graph API Manifest Patch

Use terracurl_request or your module equivalent to PATCH:

api.acceptMappedClaims = true


## Requirements:

Must reference the application object ID

Must use a bearer token (fake token OK)

Must include depends_on

Should include destroy_skip

## 🧩 Exercise 5 – SAML Troubleshooting

Error provided:

AADSTS750052: The reply address 'https://finance-app.gov/saml/consume' does not match the reply addresses configured for the application: 'https://finance-app.gov/sso/saml/acs'.
Audience: urn:va:financeapp



Explain:

How you validate ACS URLs

How you inspect SAMLRequest “Destination”

How you reconcile portal vs SP metadata differences

Why binding matters (POST/Redirect)

### 🎯 What We Evaluate

We look for:

Strong architectural reasoning

Deep familiarity with Entra ID

Ability to map requirements → claims → configuration

Terraform competence

Clear troubleshooting methodology

Communication & technical clarity

We do not expect memorization.

### End of Assessment

Good luck — and talk through your reasoning as you go.
We are evaluating your thought process, not just the final output.