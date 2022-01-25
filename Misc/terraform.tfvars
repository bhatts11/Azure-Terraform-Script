
#### Universal variables. Since location and resource group will be used in every module. ####

# location = This is already specified in terraform.tfvars under terraform-resources.
# rg_Name = This is already specified in terraform.tfvars under terraform-resources.

#### Variable section for CDN module ####

cdn_profile_name  = "azure-eus2-cdn-profile"
cdn_sku           = "Standard_Akamai"
cdn_endpoint_name = "azure-eus2-cdn-endpoint"
cdn_origin        = "cdn-endpoint-origin"
cdn_host_name     = "www.google.com"

#### Variables for Cosmos DB ####

cosmosdb_acc_name    = "azure-cosmos-db"
cosmos_db_offer      = "Standard"
cosmos_kind          = "GlobalDocumentDB"
cosmosdb_consistency = "Session"
max_interval         = 10
max_staleness_prefix = 200
cosmos_geo_prefix    = "cosmos-geo-prefix"
geo_location         = "EastUS"

#### Variables for Event Hub module ####

ehcluster                = "azure-eus2-eventcluster"
eh_sku                   = "Dedicated_1"
ehnamespace              = "eu2-eh-namespace"
eh_namespace_sku         = "Standard"
eventhub                 = "eu2-eventhub"
eventhub_partition_count = 40
msg_retention            = 1

