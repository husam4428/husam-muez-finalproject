output "resource_group_name" {
  value       = var.resource_group_name
  description = "The name of the resource group."
}

output "aks_cluster_name" {
  value       = var.aks_cluster_name
  description = "The name of the AKS cluster."
}

output "acr_login_server" {
  value       = "${var.acr_name}.azurecr.io"
  description = "The login server URL for the Azure Container Registry."
}

output "aks_fqdn" {
  value       = "hossam-k8s-dkzjnd3g.hcp.swedencentral.azmk8s.io"
  description = "The Fully Qualified Domain Name of the AKS cluster."
}  
