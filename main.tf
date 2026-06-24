# 1. Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "Hossam-Project-RG"
  location = "swedencentral"

  tags = {
    Project     = "Final"
    StudentName = "Hossam & abdulMoez"
  }
}

# 2. Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = "hossam-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# 3. Subnet
resource "azurerm_subnet" "subnet" {
  name                 = "hossam-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# 4. Azure Container Registry (ACR) - مطلوب في المشروع
resource "azurerm_container_registry" "acr" {
  name                = "hossamcloudscaleregistry" # اسم فريد للـ ACR
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic" # الـ SKU المطلوب
  admin_enabled       = true

  tags = {
    Project     = "Final"
    StudentName = "Hossam & abdulMoez"
  }
}

# 5. Azure Kubernetes Service (AKS) - بالمواصفات المطلوبة بالظبط
# 5. Azure Kubernetes Service (AKS) 
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "hossam-aks-cluster"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "hossam-k8s"
  
  oidc_issuer_enabled = true

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_B2s_v2"
    vnet_subnet_id = azurerm_subnet.subnet.id
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin     = "azure"
    service_cidr       = "192.168.0.0/16"
    dns_service_ip     = "192.168.0.10"
  }

  tags = {
    Project     = "Final"
    StudentName = "Hossam & abdulMoez"
  }
}