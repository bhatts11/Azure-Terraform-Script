
#### Universal Variable section, since resource group and location will be used in all the modules ####

variable "location" {
  type        = string
  default     = ""
  description = "Location where all these resources will be created."

}

variable "rg_Name" {
  type        = string
  default     = ""
  description = "Resource group name for all the resources."

}


#### Variable section for CDN module ####

variable "cdn_profile_name" {
  type        = string
  default     = ""
  description = "Specifies the name of the CDN Profile. Changing this forces a new resource to be created."

}

variable "cdn_sku" {
  type        = string
  default     = ""
  description = "The pricing related information of current CDN profile. Accepted values are Standard_Akamai, Standard_ChinaCdn, Standard_Microsoft, Standard_Verizon or Premium_Verizon."

}

variable "cdn_endpoint_name" {
  type        = string
  default     = ""
  description = "Specifies the name of the CDN Endpoint. Changing this forces a new resource to be created."

}

variable "cdn_origin" {
  type        = string
  default     = ""
  description = "The name of the origin. This is an arbitrary value. However, this value needs to be unique under the endpoint. Changing this forces a new resource to be created."

}

variable "cdn_host_name" {
  type        = string
  default     = ""
  description = "A string that determines the hostname/IP address of the origin server. This string can be a domain name, Storage Account endpoint, Web App endpoint, IPv4 address or IPv6 address. Changing this forces a new resource to be created."

}

#### Variables for Cosmos DB module ####

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
  type        = number
  description = "The name of the Azure region to host replicated data."

}

#### Eventhub module variable section ####

variable "ehcluster" {
  type        = string
  default     = ""
  description = "Specifies the name of the EventHub Cluster resource. Changing this forces a new resource to be created."

}

variable "eh_sku" {
  type        = string
  default     = ""
  description = "The sku name of the EventHub Cluster. The only supported value at this time is Dedicated_1."
}

variable "ehnamespace" {
  type        = string
  default     = ""
  description = "Specifies the name of the EventHub Namespace resource. Changing this forces a new resource to be created."

}

variable "eh_namespace_sku" {
  type        = string
  default     = ""
  description = "Defines which tier to use. Valid options are Basic, Standard, and Premium. Please not that setting this field to Premium will force the creation of a new resource and also requires setting zone_redundant to true."
}

variable "eventhub" {
  type        = string
  default     = ""
  description = "Specifies the name of the EventHub resource."

}

variable "eventhub_partition_count" {
  type        = number
  description = "Specifies the current number of shards on the Event Hub. Changing this forces a new resource to be created."
}

variable "msg_retention" {
  type        = number
  description = "Specifies the number of days to retain the events for this Event Hub."

}

### Redis cache variables ####

variable "redis_cache" {
  type        = string
  default     = ""
  description = "The name of the Redis instance. Changing this forces a new resource to be created."
}

variable "location" {
  type        = string
  default     = ""
  description = "Location where all these resources will be created."

}

variable "rg_Name" {
  type        = string
  default     = ""
  description = "Resource group name for all the resources."

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