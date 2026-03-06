param(
  [Parameter(Mandatory=$true)][string]$KeyVaultName,
  [Parameter(Mandatory=$true)][string]$SecretName,
  [Parameter(Mandatory=$true)][string]$SecretValue
)

Write-Host "Creating/updating secret '$SecretName' in Key Vault '$KeyVaultName'..."

az keyvault secret set `
  --vault-name $KeyVaultName `
  --name $SecretName `
  --value $SecretValue | Out-Null

Write-Host "Secret '$SecretName' created/updated."