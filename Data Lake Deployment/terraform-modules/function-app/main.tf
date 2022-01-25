# Create the Linux App Service Plan
resource "azurerm_app_service_plan" "appserviceplan" {
  name                = var.fnc_app_plan_name
  location            = var.location
  resource_group_name = var.rg_Name
  kind                = var.fnc_appsvcplan_kind
  sku {
    tier = var.fnc_appservice_tier
    size = var.fnc_appservice_size
  }
}

# Storage accounts for Azure Function app logs
resource "azurerm_storage_account" "function-app-strgaccnt" {
  name                     = var.function_app_strg_account
  resource_group_name      = var.rg_Name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Create the function app.

resource "azurerm_function_app" "function-app" {
  name                       = var.app_function_app
  location                   = var.location
  resource_group_name        = var.rg_Name
  app_service_plan_id        = azurerm_app_service_plan.appserviceplan.id
  storage_account_name       = azurerm_storage_account.function-app-strgaccnt.name
  storage_account_access_key = azurerm_storage_account.function-app-strgaccnt.primary_access_key
}