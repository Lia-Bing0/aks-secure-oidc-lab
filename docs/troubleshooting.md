# Troubleshooting

This document highlights key issues encountered while implementing the AKS Secure OIDC Workload Identity Lab.

---

## Pod Unable to Retrieve Secret

### Symptom

The Kubernetes pod deployed successfully but failed to read the mounted secret from `/mnt/secrets-store`.

### Investigation

The mounted directory inside the container was inspected:

kubectl exec -it <pod> -- ls /mnt/secrets-store

The SecretProviderClass and service account configuration were reviewed.

### Root Cause

The workload identity configuration between the Kubernetes service account and Azure Managed Identity was not fully aligned.

### Resolution

The service account annotation and SecretProviderClass configuration were corrected and the workload was redeployed.

![Secret Retrieved](images/06-secret-retrieved.png)

---

## Trivy CI Pipeline Failure

### Symptom

The GitHub Actions workflow failed during the Trivy scanning stage.

### Root Cause

The workflow attempted to scan a container image without providing a valid image reference.

### Resolution

The pipeline was updated to explicitly define scan targets:

- Terraform configuration
- Kubernetes manifests
- container image (`busybox:1.36`)

![GitHub Actions Pipeline](images/11-github-actions.png)  