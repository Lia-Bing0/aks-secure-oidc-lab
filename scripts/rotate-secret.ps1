param(
    [string]$VaultName,
    [string]$SecretName,
    [string]$NewValue
)

Write-Host "Rotating secret in Key Vault..."

az keyvault secret set `
  --vault-name $VaultName `
  --name $SecretName `
  --value $NewValue

Write-Host "Secret rotation complete."