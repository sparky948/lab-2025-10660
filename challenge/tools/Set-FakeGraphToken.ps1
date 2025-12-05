
<#
.SYNOPSIS
    Generates a fake Graph API bearer token for local Terraform runs.

.DESCRIPTION
    Creates a syntactically valid, non-functional JWT-like token and exports it
    to local environment variables for testing Terraform modules that expect a
    graph_api_bearer_token variable.

.EXAMPLE
    PS> .\Set-FakeGraphToken.ps1 -ExportToEnv
#>

param(
    [int]$Length = 256,
    [switch]$ExportToEnv
)

function New-FakeJwtSegment {
    param([int]$size = 64)
    $bytes = New-Object byte[] $size
    (New-Object System.Security.Cryptography.RNGCryptoServiceProvider).GetBytes($bytes)
    return [Convert]::ToBase64String($bytes).TrimEnd('=').Replace('+','-').Replace('/','_')
}

# Fake JWT header
$header = @{
    alg = "RS256"
    typ = "JWT"
} | ConvertTo-Json -Compress
$headerEncoded = [Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes($header)).TrimEnd('=').Replace('+','-').Replace('/','_')

# Fake JWT payload
$payload = @{
    aud = "https://graph.microsoft.com"
    iss = "https://login.microsoftonline.com/fake-tenant/v2.0"
    exp = [int][double]::Parse((Get-Date).AddHours(1).ToUniversalTime().Subtract([datetime]'1970-01-01').TotalSeconds)
    nbf = [int][double]::Parse((Get-Date).AddMinutes(-5).ToUniversalTime().Subtract([datetime]'1970-01-01').TotalSeconds)
    iat = [int][double]::Parse((Get-Date).AddMinutes(-1).ToUniversalTime().Subtract([datetime]'1970-01-01').TotalSeconds)
    sub = "fake-user"
    tid = "fake-tenant-id"
    aio = "fake-resource-string"
    custom = "Fake token for non-production testing"
} | ConvertTo-Json -Compress
$payloadEncoded = [Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes($payload)).TrimEnd('=').Replace('+','-').Replace('/','_')

# Fake signature block
$signature = New-FakeJwtSegment -size $Length

# Construct token
$token = "$headerEncoded.$payloadEncoded.$signature"

if ($ExportToEnv) {
    $Env:TF_VAR_graph_api_bearer_token = $token
    $Env:graph_api_bearer_token = $token
    Write-Host "Fake Graph API token exported to environment variables." -ForegroundColor Green
}

return $token
