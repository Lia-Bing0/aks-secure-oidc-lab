param(
  [Parameter(Mandatory=$true)][string]$ResourceGroup,
  [Parameter(Mandatory=$true)][string]$KeyVaultName,
  [Parameter(Mandatory=$true)][string]$SecretName
)

Write-Host "=== 1) Secret metadata ==="
.\scripts\kv-check-secret-metadata.ps1 `
  -KeyVaultName $KeyVaultName `
  -SecretName $SecretName

Write-Host "`n=== 2) Role assignments on Key Vault ==="
.\scripts\kv-list-role-assignments.ps1 `
  -ResourceGroup $ResourceGroup `
  -KeyVaultName $KeyVaultName

Write-Host "`n=== 3) Access test (no value) ==="
.\scripts\kv-can-access-secret.ps1 `
  -KeyVaultName $KeyVaultName `
  -SecretName $SecretName

Write-Host "`n✅ Key Vault verification complete."