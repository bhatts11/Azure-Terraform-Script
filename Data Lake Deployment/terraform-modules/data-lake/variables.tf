variable "cosmosdb_acc_name" {
  type        = string
  default     = ""
  description = "Specifies the name of the CosmosDB Account. Changing this forces a new resource to be created."

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

variable "cosmos_db_offer" {
  type    = string
  default = ""
  validation {
    condition     = contains(["Standard"], var.cosmos_db_offer)
    error_message = "Accepted values are Standard."
  }
  description = "Specifies the Offer Type to use for this CosmosDB Account - currently this can only be set to Standard."

}

variable "cosmos_kind" {
  type    = string
  default = "GlobalDocumentDB"
  validation {
    condition     = contains(["GlobalDocumentDB", "MongoDB"], var.cosmos_kind)
    error_message = "Accepted values are GlobalDocumentDB and MongoDB."
  }
  description = "Specifies the Kind of CosmosDB to create - possible values are GlobalDocumentDB and MongoDB. Defaults to GlobalDocumentDB. Changing this forces a new resource to be created."

}

variable "cosmosdb_consistency" {
  type    = string
  default = ""
  validation {
    condition     = contains(["BoundedStaleness", "Eventual", "Session", "Strong", "ConsistentPrefix"], var.cosmosdb_consistency)
    error_message = "Accepted values are BoundedStaleness, Eventual, Session, Strong or ConsistentPrefix."
  }
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