param(
  [Parameter(Mandatory=$true)][string]$KeyVaultName,
  [Parameter(Mandatory=$true)][string]$SecretName
)

try {
  $id = az keyvault secret show `
    --vault-name $KeyVaultName `
    --name $SecretName `
    --query id -o tsv

  Write-Host "✅ Access confirmed (secret id retrieved): $id"
} catch {
  Write-Host "❌ Access failed. Check RBAC / propagation / vault settings."
  throw
}