param(
  [Parameter(Mandatory=$true)][string]$ResourceGroup,
  [Parameter(Mandatory=$true)][string]$KeyVaultName
)

Write-Host "Getting Key Vault resource ID..."
$kvId = az keyvault show `
  --name $KeyVaultName `
  --resource-group $ResourceGroup `
  --query id -o tsv

Write-Host "Getting signed-in user object ID..."
$me = az ad signed-in-user show --query id -o tsv

Write-Host "Assigning 'Key Vault Secrets Officer' to current user..."
az role assignment create `
  --assignee-object-id $me `
  --assignee-principal-type User `
  --role "Key Vault Secrets Officer" `
  --scope $kvId

Write-Host "Done. RBAC propagation can take a couple minutes."