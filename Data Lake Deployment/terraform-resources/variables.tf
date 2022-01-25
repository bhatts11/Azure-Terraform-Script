variable "subscription_id" {
  type    = string
  default = ""
}
variable "location" {
  type    = string
  default = ""
}
variable "rg_Name" {
  type    = string
  default = ""
}
variable "vnet_Name" {
  type    = string
  default = ""
}
variable "vnet_Address" {
  type    = string
  default = ""
}
variable "subnet_NameList" {
  type    = list(string)
  default = [""]
}
variable "subnet_AddressList" {
  type    = list(string)
  default = [""]
}
## Pre defined KV details
variable "devKV_Name" {
  type    = string
  default = ""
}
variable "akskv_SPClientID" {
  type    = string
  default = ""
}
variable "akskv_SPClientSec" {
  type    = string
  default = ""
}
variable "sqlkv_AdmUserName" {
  type    = string
  default = ""
}
variable "sqlkv_AdmUsrPasswd" {
  type    = string
  default = ""
}

variable "appgtwy_PublicIPName" {
  type    = string
  default = ""
}
variable "appgtwy_AllocationMethod" {
  type    = string
  default = ""
}
variable "appgtwy_PipSKU" {
  type    = string
  default = ""
}
variable "appgtwy_MSIName" {
  type    = string
  default = ""
}
variable "appgtwy_BackendAddressPool" {
  type    = string
  default = ""
}
variable "appgtwy_FrontEndPort" {
  type    = string
  default = ""
}
variable "appgtwy_FrondEndIPConfig" {
  type    = string
  default = ""
}
variable "appgtwy_HttpSetting" {
  type    = string
  default = ""
}
variable "appgtwy_ListenrHttp" {
  type    = string
  default = ""
}
variable "appgtwy_RequetRoutingRule" {
  type    = string
  default = ""
}
variable "appgtwy_RedirectConfig" {
  type    = string
  default = ""
}
variable "appgtwy_Name" {
  type    = string
  default = ""
}
variable "appgtwy_Zones" {
  type    = list(string)
  default = [""]
}
variable "appgtwy_SKUName" {
  type    = string
  default = ""
}
variable "appgtwy_SKUTier" {
  type    = string
  default = ""
}
variable "appgtwy_CapacityMin" {
  type    = number
  default = 1
}
variable "appgtwy_CapacityMax" {
  type    = number
  default = 5
}
variable "appgtwy_IdentityType" {
  type    = string
  default = ""
}
variable "appgtwy_IPConfig" {
  type    = string
  default = ""
}

###
variable "keyvalut_Name" {
  type    = string
  default = ""
}
variable "keyvalut_SKU" {
  type    = string
  default = ""
}
### StorageAccount
variable "storageaccount_Name" {
  type    = string
  default = ""
}
variable "storageaccount_Tier" {
  type    = string
  default = ""
}
variable "storageaccount_Kind" {
  type    = string
  default = ""
}
variable "storageaccount_ReplicationType" {
  type    = string
  default = ""
}
variable "storageaccount_ContainerName" {
  type    = string
  default = ""
}
#### Frontfoor
variable "FrontDoor_Name" {
  type = string
}
variable "FD_RoutingRuleName" {
  type = string
}
variable "FD_FrontEndPointName" {
  type = string
}
variable "FD_FrontEndHostName" {
  type = string
}
variable "FD_forwdProtocal" {
  type = string
}
variable "FD_BackendPoolName" {
  type = string
}
variable "FD_BackendLBName" {
  type = string
}
variable "FD_BackendPoolHealthProbeName" {
  type = string
}
variable "FD_BackendPoolHost" {
  type = string
}
variable "FD_BackendPoolHostAddress" {
  type = string
}

variable "app_plan_name" {
  type        = string
  default     = ""
  description = "App service plan name for webapp"
}
variable "appsvcplan_kind" {
  type        = string
  default     = "Windows"
  description = "The kind of the App Service Plan to create. Possible values are Windows (also available as App), Linux, elastic (for Premium Consumption) and FunctionApp (for a Consumption Plan). Defaults to Windows. Changing this forces a new resource to be created."
}
variable "appservice_tier" {
  type        = string
  default     = ""
  description = "Azure App service Tier (Standard,Free,Basic, etc .)"
}

variable "appservice_size" {
  type        = string
  default     = ""
  description = "Azure App service Tier size"
}

variable "web_app_name" {
  type        = string
  default     = ""
  description = "Webapp name to deploy the resources"
}

#### Variables for Cosmos DB and ADF module ####

variable "cosmosdb_acc_name" {
  type        = string
  default     = ""
  description = "Specifies the name of the CosmosDB Account. Changing this forces a new resource to be created."

}


variable "cosmos_db_offer" {
  type        = string
  default     = ""
  description = "Specifies the Offer Type to use for this CosmosDB Account - currently this can only be set to Standard."

}

variable "cosmos_kind" {
  type        = string
  default     = "GlobalDocumentDB"
  description = "Specifies the Kind of CosmosDB to create - possible values are GlobalDocumentDB and MongoDB. Defaults to GlobalDocumentDB. Changing this forces a new resource to be created."

}

variable "cosmosdb_consistency" {
  type        = string
  default     = ""
  description = "The Consistency Level to use for this CosmosDB Account - can be either BoundedStaleness, Eventual, Session, Strong or ConsistentPrefix."

}

variable "max_interval" {
  type = number
  # default = ""
  description = "When used with the Bounded Staleness consistency level, this value represents the time amount of staleness (in seconds) tolerated. Accepted range for this value is 5 - 86400 (1 day). Defaults to 5. Required when consistency_level is set to BoundedStaleness."

}

variable "max_staleness_prefix" {
  type = number
  #default = ""
  description = "When used with the Bounded Staleness consistency level, this value represents the number of stale requests tolerated. Accepted range for this value is 10 – 2147483647. Defaults to 100. Required when consistency_level is set to BoundedStaleness."

}

variable "cosmos_geo_prefix" {
  type        = string
  default     = ""
  description = "When used with the Bounded Staleness consistency level, this value represents the time amount of staleness (in seconds) tolerated. Accepted range for this value is 5 - 86400 (1 day). Defaults to 5. Required when consistency_level is set to BoundedStaleness."

}

variable "geo_location" {
  type        = string
  description = "The name of the Azure region to host replicated data."

}

variable "adfhost" {
  type        = string
  default     = ""
  description = "Specifies the name of the Data Factory. Changing this forces a new resource to be created. Must be globally unique. See the Microsoft documentation for all restrictions."

}

variable "cosmosdb_linked_svc" {
  type        = string
  default     = ""
  description = "Specifies the name of the Data Factory Linked Service for CosmosDB."

}

variable "cosmos_db_name" {
  type        = string
  default     = ""
  description = "The name of the cosmos database for the linked service. Required if connection_string is unspecified."

}

variable "datalake_linked_svc" {
  type        = string
  default     = ""
  description = "Specifies the name of the Data Factory Linked Service for DataLake."

}

variable "datalake_url" {
  type        = string
  default     = ""
  description = "The endpoint for the Azure Data Lake Storage Gen2 service."

}

variable "adf_datalake_linked_msi" {
  type        = string
  default     = ""
  description = "Whether to use the Data Factory's managed identity to authenticate against the Azure Data Lake Storage Gen2 account."
}

### Redis cache variables ####

variable "redis_cache" {
  type        = string
  default     = ""
  description = "The name of the Redis instance. Changing this forces a new resource to be created."
}

variable "redis_capacity" {
  type        = number
  description = "The size of the Redis cache to deploy. Valid values for a SKU family of C (Basic/Standard) are 0, 1, 2, 3, 4, 5, 6, and for P (Premium) family are 1, 2, 3, 4."

}

variable "redis_family" {
  type        = string
  default     = ""
  description = "The SKU family/pricing group to use. Valid values are C (for Basic/Standard SKU family) and P (for Premium)."
}

variable "redis_sku" {
  type        = string
  default     = ""
  description = "The SKU of Redis to use. Possible values are Basic, Standard and Premium."

}

variable "non_ssl_port_redis" {
  type        = string
  default     = "false"
  description = "Enable the non-SSL port (6379) - disabled by default. Valid options are true or false"
}

variable "min_tls_redis" {
  type        = number
  description = "Specifies the number of days to retain the events for this Event Hub."

}


variable "fnc_app_plan_name" {
  type        = string
  default     = ""
  description = "App service plan name for webapp"
}
variable "fnc_appsvcplan_kind" {
  type        = string
  default     = "Windows"
  description = "The kind of the App Service Plan to create. Possible values are Windows (also available as App), Linux, elastic (for Premium Consumption) and FunctionApp (for a Consumption Plan). Defaults to Windows. Changing this forces a new resource to be created."
}
variable "fnc_appservice_tier" {
  type        = string
  default     = ""
  description = "Azure App service Tier (Standard,Free,Basic, etc .)"
}

variable "fnc_appservice_size" {
  type        = string
  default     = ""
  description = "Azure App service Tier size"
}

variable "function_app_strg_account" {
  type        = string
  default     = ""
  description = "Storage account to be used for function app"
}

variable "app_function_app" {
  type        = string
  default     = ""
  description = "Function app name for this deployment"
}
