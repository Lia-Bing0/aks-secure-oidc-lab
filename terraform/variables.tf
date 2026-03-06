variable "project_name" {
  description = "Used for naming resources"
  type        = string
  default     = "aks-devsec-oidc"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "eastus"
}

variable "kubernetes_version" {
  description = "Optional AKS version. Leaving null to use Azure default"
  type        = string
  default     = null
}

variable "node_vm_size" {
  description = "AKS node VM size"
  type        = string
  default     = "Standard_B2s"
}

variable "node_count" {
  description = "Initial node count"
  type        = number
  default     = 1
}

variable "vnet_cidr" {
  description = "VNet CIDR"
  type        = string
  default     = "10.10.0.0/16"
}

variable "subnet_cidr" {
  description = "Subnet CIDR for AKS"
  type        = string
  default     = "10.10.1.0/24"
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
  default = {
    project = "devsecops"
    owner   = "lia"
  }
}