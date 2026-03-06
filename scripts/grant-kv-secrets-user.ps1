param(
    [string]$ResourceGroup,
    [string]$KeyVaultName,
    [string]$IdentityName
)

Write-Host "Fetching Key Vault ID..."
$kvId = az keyvault show `
  --name $KeyVaultName `
  --resource-group $ResourceGroup `
  --query id -o tsv

Write-Host "Fetching Managed Identity principal ID..."
$principalId = az identity show `
  --name $IdentityName `
  --resource-group $ResourceGroup `
  --query principalId -o tsv

Write-Host "Assigning 'Key Vault Secrets User' role..."

az role assignment create `
  --assignee-object-id $principalId `
  --assignee-principal-type ServicePrincipal `
  --role "Key Vault Secrets User" `
  --scope $kvId

Write-Host "Role assignment complete."
Write-Host "RBAC propagation can take a couple minutes."