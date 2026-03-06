param(
  [Parameter(Mandatory=$true)][string]$ResourceGroup,
  [Parameter(Mandatory=$true)][string]$Location,
  [Parameter(Mandatory=$true)][string]$IdentityName,
  [Parameter(Mandatory=$true)][string]$IssuerUrl
)

Write-Host "Creating Managed Identity..."

$identity = az identity create `
  --name $IdentityName `
  --resource-group $ResourceGroup `
  --location $Location `
  | ConvertFrom-Json

$clientId = $identity.clientId
$principalId = $identity.principalId

Write-Host "Managed Identity created."
Write-Host "Client ID: $clientId"
Write-Host "Principal ID: $principalId"

Write-Host "Creating Federated Credential..."

az identity federated-credential create `
  --name aks-federation `
  --identity-name $IdentityName `
  --resource-group $ResourceGroup `
  --issuer "$IssuerUrl" `
  --subject system:serviceaccount:default:workload-identity-sa `
  --audience api://AzureADTokenExchange

Write-Host "Federated credential created."
Write-Host "Workload identity setup complete."

[PSCustomObject]@{
  ClientId    = $clientId
  PrincipalId = $principalId
}