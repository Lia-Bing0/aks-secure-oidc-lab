Write-Host "Checking CSI driver configuration..."

kubectl get csidriver secrets-store.csi.k8s.io > $null

Write-Host "Patching CSI driver to enable token requests..."

kubectl patch csidriver secrets-store.csi.k8s.io `
  --type merge `
  --patch-file ./patches/csidriver-tokenrequests.json

Write-Host "Restarting CSI driver daemonset..."

kubectl rollout restart ds/csi-secrets-store-secrets-store-csi-driver -n kube-system
kubectl rollout status ds/csi-secrets-store-secrets-store-csi-driver -n kube-system

Write-Host "CSI token request configuration complete."