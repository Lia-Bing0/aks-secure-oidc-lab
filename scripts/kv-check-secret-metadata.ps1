param(
  [Parameter(Mandatory=$true)][string]$KeyVaultName,
  [Parameter(Mandatory=$true)][string]$SecretName
)

az keyvault secret show `
  --vault-name $KeyVaultName `
  --name $SecretName `
  --query "{name:name, id:id, enabled:attributes.enabled, created:attributes.created, updated:attributes.updated}" `
  -o json