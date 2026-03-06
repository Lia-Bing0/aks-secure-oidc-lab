param(
  [Parameter(Mandatory=$true)][string]$ResourceGroup,
  [Parameter(Mandatory=$true)][string]$KeyVaultName
)

$kvId = az keyvault show `
  --name $KeyVaultName `
  --resource-group $ResourceGroup `
  --query id -o tsv

az role assignment list --scope $kvId -o table