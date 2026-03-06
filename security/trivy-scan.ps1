Write-Host "===================================="
Write-Host "Running Terraform Security Scan"
Write-Host "===================================="

trivy config terraform/ --severity HIGH,CRITICAL

Write-Host ""
Write-Host "===================================="
Write-Host "Running Kubernetes Manifest Scan"
Write-Host "===================================="

trivy config kubernetes/ --severity HIGH,CRITICAL

Write-Host ""
Write-Host "===================================="
Write-Host "Running Container Image Scan"
Write-Host "===================================="

trivy image busybox:1.36

Write-Host ""
Write-Host "Trivy scans complete."