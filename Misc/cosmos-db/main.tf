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