param(
  [Parameter(Mandatory=$true)][string]$ResourceGroup,
  [Parameter(Mandatory=$true)][string]$ClusterName
)

az aks get-credentials `
  --resource-group $ResourceGroup `
  --name $ClusterName

kubectl get nodes