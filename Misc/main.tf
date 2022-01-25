
#### Module decrlatarion for CDN resource ####

module "cdn" {
  source            = "../CDN"
  cdn_profile_name  = var.cdn_profile_name
  location          = var.location
  rg_Name           = var.rg_Name
  cdn_sku           = var.cdn_sku
  cdn_endpoint_name = var.cdn_endpoint_name
  cdn_origin        = var.cdn_origin
  cdn_host_name     = var.cdn_host_name
}

#### Module decrlatarion for Cosmos DB resource ####

module "cosmos_db" {
  source               = "../cosmos-db"
  cosmosdb_acc_name    = var.cosmosdb_acc_name
  location             = var.location
  rg_Name              = var.rg_Name
  cosmos_db_offer      = var.cosmos_db_offer
  cosmos_kind          = var.cosmos_kind
  cosmosdb_consistency = var.cosmosdb_consistency
  max_interval         = var.max_interval
  max_staleness_prefix = var.max_staleness_prefix
  cosmos_geo_prefix    = var.cosmos_geo_prefix
  geo_location         = var.geo_location

}

#### Module decrlatarion for Event Hub resource ####

module "eventhub" {
  source                   = "../eventhub/"
  ehcluster                = var.ehcluster
  rg_Name                  = var.rg_Name
  location                 = var.location
  eh_sku                   = var.eh_sku
  ehnamespace              = var.ehnamespace
  eh_namespace_sku         = var.eh_namespace_sku
  eventhub                 = var.eventhub
  eventhub_partition_count = var.eventhub_partition_count
  msg_retention            = var.msg_retention

}


