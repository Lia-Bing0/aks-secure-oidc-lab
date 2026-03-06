if (-not (Get-Command helm -ErrorAction SilentlyContinue)) {
  throw "Helm is not installed. Install it with: winget install -e --id Helm.Helm"
}

Write-Host "Adding CSI driver Helm repo..."

helm repo add csi-secrets-store https://kubernetes-sigs.github.io/secrets-store-csi-driver/charts
helm repo update

Write-Host "Installing CSI driver..."

helm install csi-secrets-store `
  csi-secrets-store/secrets-store-csi-driver `
  --namespace kube-system `
  --set syncSecret.enabled=true

Write-Host "Installing Azure provider..."

kubectl apply -f https://raw.githubusercontent.com/Azure/secrets-store-csi-driver-provider-azure/master/deployment/provider-azure-installer.yaml

Write-Host "CSI driver installation complete."