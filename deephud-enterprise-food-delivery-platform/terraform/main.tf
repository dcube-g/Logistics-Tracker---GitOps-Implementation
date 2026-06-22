resource "azurerm_resource_group" "rg" {

  name     = "rg-deephud-prod-southindia"
  location = var.location

  tags = {
    Project     = "DeePhud"
    Environment = "Production"
    ManagedBy   = "Terraform"
  }
}

resource "azurerm_virtual_network" "vnet" {

  name                = "vnet-deephud-prod-southindia"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  address_space = ["10.10.0.0/16"]
}

resource "azurerm_subnet" "aks" {

  name                 = "snet-aks-prod"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name

  address_prefixes = ["10.10.1.0/24"]
}

resource "azurerm_container_registry" "acr" {

  name                = "acrdeephudprod01"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  sku           = "Basic"
  admin_enabled = false
}

resource "azurerm_kubernetes_cluster" "aks" {

  name                = "aks-deephud-prod-01"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  dns_prefix = "deephud"

  sku_tier = "Free"

  default_node_pool {
    name       = "system"
    node_count = 1
    vm_size    = "Standard_D2as_v5"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Project     = "DeePhud"
    Environment = "Production"
    ManagedBy   = "Terraform"
  }
}

resource "azurerm_role_assignment" "acr_pull" {

  scope                = azurerm_container_registry.acr.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
}

output "resource_group" {
  value = azurerm_resource_group.rg.name
}

output "aks_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server
}
