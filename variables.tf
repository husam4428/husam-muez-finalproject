variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
  default     = "Hossam-Project-RG"
}

variable "location" {
  description = "Azure region where resources are deployed"
  type        = string
  default     = "swedencentral"
}

variable "aks_cluster_name" {
  description = "Name of the Managed AKS Cluster"
  type        = string
  default     = "hossam-aks-cluster"
}

variable "acr_name" {
  description = "Name of the Azure Container Registry"
  type        = string
  default     = "hossamcloudscaleregistry"
}