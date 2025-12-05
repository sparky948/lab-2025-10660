# Entra ID SSO Migration – Technical Assessment

A hands-on technical assessment for **Lead Technical Integration Engineer** candidates focused on Entra ID SSO modernization, SAML configuration, and Terraform infrastructure-as-code.

## 📋 Overview

This repository contains materials for a live technical interview that evaluates:

- Entra ID SAML application configuration
- Header-based SSO migration patterns (SiteMinder → Entra App Proxy)
- Terraform for Azure AD/Entra ID resources
- Graph API integration
- SAML troubleshooting methodology

## 📁 Repository Structure

```
├── ASSESSMENT.md              # Full assessment instructions
├── challenge/
│   ├── benefits_app.tf        # Terraform exercise file
│   ├── claims.json            # Claims mapping reference
│   ├── acceptMappedClaims.tf  # Graph API patch exercise
│   ├── terraform.tfvars.example
│   ├── SOLUTION_NOTES.md      # Solution reference
│   └── tools/
│       └── Set-FakeGraphToken.ps1  # Mock token generator
└── README.md
```

## 🚀 Prerequisites

Before the live session, ensure you have:

- [ ] Ability to **share your screen** in Microsoft Teams
- [ ] A code editor (**VS Code recommended**)
- [ ] Terraform installed (`terraform -version`)
- [ ] A modern browser with developer tools (Chrome/Edge)
- [ ] PowerShell available
- [ ] This repository cloned locally

## 📝 Assessment Exercises

| Exercise | Topic | Type |
|----------|-------|------|
| 1 | SAML App Configuration in Entra Portal | Hands-on |
| 2 | Header-Based SSO Migration (App Proxy) | Design |
| 3 | Terraform SAML Configuration | Code |
| 4 | Graph API Manifest Patch | Code |
| 5 | SAML Troubleshooting | Analysis |

## 🛠️ Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/sparky948/lab-2025-10660.git
   cd lab-2025-10660
   ```

2. Review the full assessment instructions:
   ```bash
   cat ASSESSMENT.md
   ```

3. Open the challenge files in your editor:
   ```bash
   code challenge/
   ```

## 📖 Key Files

- **[ASSESSMENT.md](./ASSESSMENT.md)** – Complete assessment instructions and exercises
- **[challenge/benefits_app.tf](./challenge/benefits_app.tf)** – Terraform exercise for SAML SSO configuration
- **[challenge/claims.json](./challenge/claims.json)** – Claims mapping reference data

## 🎯 Evaluation Criteria

We evaluate candidates on:

- Strong architectural reasoning
- Deep familiarity with Entra ID
- Ability to map requirements → claims → configuration
- Terraform competence
- Clear troubleshooting methodology
- Communication & technical clarity

> **Note:** We do not expect memorization. Talk through your reasoning as you go.

## 📄 License

Internal use only – assessment materials for candidate evaluation.
