project_name = "aks-devsec-oidc"
location     = "centralus"

node_vm_size = "Standard_B2pls_v2"
node_count   = 1

tags = {
  project = "devsecops"
  owner   = "lia"
  repo    = "aks-secure-oidc"
}