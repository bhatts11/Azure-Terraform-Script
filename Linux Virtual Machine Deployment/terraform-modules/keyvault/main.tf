data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv" {
  name                = var.keyvalut_Name
  resource_group_name = var.rg_Name
  location            = var.location
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = var.keyvalut_SKU
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions         = ["get", "update", "list"]
    secret_permissions      = ["get", "list", "set"]
    certificate_permissions = ["get", "list", "update", "create", "import"]
  }
  network_acls {
    default_action = "Deny"
    bypass         = "AzureServices"
  }

} 