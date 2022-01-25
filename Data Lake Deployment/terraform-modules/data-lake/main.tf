
resource "azurerm_cosmosdb_account" "cosmosdb" {
  name                = var.cosmosdb_acc_name
  location            = var.location
  resource_group_name = var.rg_Name
  offer_type          = var.cosmos_db_offer
  kind                = var.cosmos_kind

  consistency_policy {
    consistency_level       = var.cosmosdb_consistency
    max_interval_in_seconds = var.max_interval
    max_staleness_prefix    = var.max_staleness_prefix
  }

  geo_location {
    prefix            = var.cosmos_geo_prefix
    location          = var.geo_location
    failover_priority = 0
  }

}

resource "azurerm_data_factory" "adf" {
  name                = var.adfhost
  location            = var.location
  resource_group_name = var.rg_Name
}


resource "azurerm_data_factory_linked_service_cosmosdb" "cosmosdb_linked_svc" {
  name                = var.cosmosdb_linked_svc
  resource_group_name = var.rg_Name
  data_factory_id     = azurerm_data_factory.adf.id
  account_endpoint    = azurerm_cosmosdb_account.cosmosdb.endpoint
  account_key         = azurerm_cosmosdb_account.cosmosdb.primary_key
  database            = var.cosmos_db_name

}

resource "azurerm_data_factory_linked_service_data_lake_storage_gen2" "datalake_linked_svc" {
  name                 = var.datalake_linked_svc
  resource_group_name  = var.rg_Name
  data_factory_id      = azurerm_data_factory.adf.id
  use_managed_identity = var.adf_datalake_linked_msi
  url                  = var.datalake_url
}

