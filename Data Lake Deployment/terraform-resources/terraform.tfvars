subscription_id = "aa01771c-xxxx-4809-xxxx-xxxxxxxe"
## VNET - SUBNET
rg_Name            = "Demo_RG" ## We have to change as per env
location           = "eastus2"

### Frontdoor                  = ###
FrontDoor_Name                = "devfd"
FD_RoutingRuleName            = "devfd-routing-rule"
FD_FrontEndPointName          = "devfd-azurefd-net"
FD_FrontEndHostName           = "devfd.azurefd.net"
FD_forwdProtocal              = "HttpsOnly" #HttpsOnly
FD_BackendPoolName            = "devfdbkendpool"
FD_BackendLBName              = "devfdlb01"
FD_BackendPoolHealthProbeName = "devfdpoolhp01"
FD_BackendPoolHost            = "www.google.com"
FD_BackendPoolHostAddress     = "www.google.com"

### App Service Plan and Web App 
app_plan_name   = "terraform-test-plan"
web_app_name    = "terra-test-web"
appsvcplan_kind = "Windows"
appservice_tier = "Standard"
appservice_size = "S1"

#### Variables for Cosmos DB and ADF ####

cosmosdb_acc_name       = "azure-cosmos-db"
cosmos_db_offer         = "Standard"
cosmos_kind             = "GlobalDocumentDB"
cosmosdb_consistency    = "Session"
max_interval            = 10
max_staleness_prefix    = 200
cosmos_geo_prefix       = "cosmos-geo-prefix"
geo_location            = "westus"
adfhost                 = "azure-datafactory-datalake"
cosmosdb_linked_svc     = "cosmosdb_linked_service"
cosmos_db_name          = "test-db"
datalake_linked_svc     = "datalake_linked_service"
datalake_url            = "https://datalake-test"
adf_datalake_linked_msi = "true"

#### Variables for Redis Cache Deployment ####

redis_cache        = "azure-redis-cache"
redis_capacity     = 2
redis_family       = "C"
redis_sku          = "Standard"
non_ssl_port_redis = "false"
min_tls_redis      = 1.2

#### Variables for function-app deployment ####

fnc_app_plan_name         = "function-app-planname"
fnc_appsvcplan_kind       = "FunctionApp"
fnc_appservice_tier       = "Standard"
fnc_appservice_size       = "S1"
function_app_strg_account = "fnctnapp03865"
app_function_app          = "appfunction"
