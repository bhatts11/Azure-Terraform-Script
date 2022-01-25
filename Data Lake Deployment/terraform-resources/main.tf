# backend storageaccount declaration to store the terraform state file. This should exist already.
terraform {
  backend "azurerm" {
    #   subscription_id       = "da74xxxx-9c9a-xxxx-8fae-xxxxxxxxxxxx"
    subscription_id      = "aaxxxx-xxxx-4809-xxxx-3xxxxxxxe"
    resource_group_name  = "Susheel_Training"
    storage_account_name = "terraformbackend" # Storage account used for backend
    container_name       = "terraformstate"
    key                  = "terraform.tfstate" # Terraform State file
  }
}
# Azurerm providers declaration
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.42.0"
    }
  }
  #required_version = ">= 0.13"
}
provider "azurerm" {
  alias                      = "coeauto"
  subscription_id            = var.subscription_id
  skip_provider_registration = true
  features {}
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

data "azurerm_client_config" "current" {}

#############################################################################

######## 1. Frontdoor Deployment Code ###########
## For DR. no need to deploy FD, we need to comment the FD code here for DR.

module "front_door" {
  source                        = "../terraform-modules/frontdoor"
  rg_Name                       = var.rg_Name
  FrontDoor_Name                = var.FrontDoor_Name
  FD_RoutingRuleName            = var.FD_RoutingRuleName
  FD_FrontEndPointName          = var.FD_FrontEndPointName
  FD_FrontEndHostName           = var.FD_FrontEndHostName ## this should be Az-FrontDoorName.azurefd.net
  FD_forwdProtocal              = var.FD_forwdProtocal
  FD_BackendPoolName            = var.FD_BackendPoolName
  FD_BackendLBName              = var.FD_BackendLBName
  FD_BackendPoolHealthProbeName = var.FD_BackendPoolHealthProbeName
  FD_BackendPoolHost            = var.FD_BackendPoolHost
  FD_BackendPoolHostAddress     = var.FD_BackendPoolHostAddress
}

#######################################################

######## 2. CosmosDB and data factory Deployment ###########

module "cosmos_db_adf" {
  source                  = "../terraform-modules/data-factory"
  cosmosdb_acc_name       = var.cosmosdb_acc_name
  location                = var.location
  rg_Name                 = var.rg_Name
  cosmos_db_offer         = var.cosmos_db_offer
  cosmos_kind             = var.cosmos_kind
  cosmosdb_consistency    = var.cosmosdb_consistency
  max_interval            = var.max_interval
  max_staleness_prefix    = var.max_staleness_prefix
  cosmos_geo_prefix       = var.cosmos_geo_prefix
  geo_location            = var.geo_location
  adfhost                 = var.adfhost
  cosmosdb_linked_svc     = var.cosmosdb_linked_svc
  cosmos_db_name          = var.cosmos_db_name
  datalake_linked_svc     = var.datalake_linked_svc
  datalake_url            = var.datalake_url
  adf_datalake_linked_msi = var.adf_datalake_linked_msi

}

######## 3. Azure Web App Deployment ###########
## Since site_config is dynamic and based on the framework. Site config needs to be changed in the WebApp module manually

module "webapp" {
  source          = "../terraform-modules/webapp"
  app_plan_name   = var.app_plan_name
  web_app_name    = var.web_app_name
  rg_Name         = var.rg_Name
  appsvcplan_kind = var.appsvcplan_kind
  appservice_tier = var.appservice_tier
  appservice_size = var.appservice_size
  location        = var.location

}

######## 4. Redis Cache Deployment ###########

module "redis_cache" {

  source             = "../terraform-modules/redis-cache"
  redis_cache        = var.redis_cache
  location           = var.location
  rg_Name            = var.rg_Name
  redis_capacity     = var.redis_capacity
  redis_family       = var.redis_family
  redis_sku          = var.redis_sku
  non_ssl_port_redis = var.non_ssl_port_redis
  min_tls_redis      = var.min_tls_redis

}

#### 5. Function app deployment ####

module "function-app" {
  source                    = "../terraform-modules/function-app"
  fnc_app_plan_name         = var.fnc_app_plan_name
  location                  = var.location
  rg_Name                   = var.rg_Name
  fnc_appsvcplan_kind       = var.fnc_appsvcplan_kind
  fnc_appservice_tier       = var.fnc_appservice_tier
  fnc_appservice_size       = var.fnc_appservice_size
  function_app_strg_account = var.function_app_strg_account
  app_function_app          = var.app_function_app
}