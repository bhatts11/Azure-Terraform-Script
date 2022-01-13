## ACR Container 
resource "azurerm_container_registry" "container_registery" {
  name                = var.acr_Name
  resource_group_name = var.rg_Name
  location            = var.location
  sku                 = var.acr_SKU
  admin_enabled       = true
}
