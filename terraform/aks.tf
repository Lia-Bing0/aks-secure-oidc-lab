resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-${local.name_prefix}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "dns-${local.name_prefix}"

  kubernetes_version = var.kubernetes_version

  # 👇 Your key DevSecOps identity signals
  oidc_issuer_enabled       = true
  workload_identity_enabled = true

  identity {
    type = "SystemAssigned"
  }

  default_node_pool {
    name                = "system"
    vm_size             = var.node_vm_size
    node_count          = var.node_count
    vnet_subnet_id      = azurerm_subnet.aks.id
    os_disk_size_gb     = 64
    type                = "VirtualMachineScaleSets"
    orchestrator_version = var.kubernetes_version
  }

  depends_on = [azurerm_subnet.aks]

  # Keep it simple + reliable for a lab
  network_profile {
    network_plugin    = "kubenet"
    load_balancer_sku = "standard"
  }

  oms_agent {
    log_analytics_workspace_id = azurerm_log_analytics_workspace.law.id
  }

  tags = var.tags
}