variable "MySQLServer_Name" {
  type        = string
  default     = ""
  description = "MySQL Server name to deploy"
  validation {
    condition     = length(var.MySQLServer_Name) > 6 && can(regex("dev", lower(var.MySQLServer_Name)))
    error_message = " The SQLServer_Name must be valied name, should contain \" dev \". This can be configured in variables.tf file to streamline according to the environment."
  }
}
variable "MySQLServer_Version" {
  type        = string
  default     = ""
  description = "SQL Server version value"
}
variable "MySQLServer_AdminUserName" {
  type        = string
  default     = "mysqladmin"
  description = "MySQL Server Admin user - this will be fetched from kv secrets"
}
variable "MySQLServer_AdminUserPasswd" {
  type        = string
  sensitive   = true
  default     = "mysqladmin"
  description = "MySQL Server Admin user password - this will be fetched from kv secrets"
}
variable "MySQLServerStorageSize" {
  type        = number
  default     = 1024
  description = "MySQL server storage size to set"
}
variable "MySQLServerSKU_Name" {
  type        = string
  default     = "B_Gen4_1"
  description = "Specifies the SKU Name for this MySQL Server. The name of the SKU, follows the tier + family + cores pattern (e.g. B_Gen4_1, GP_Gen5_8)."
}
variable "MySQLServer_StorageAutoGrowEnabled" {
  type        = bool
  default     = true
  description = "Enable/Disable auto-growing of the storage"
}
variable "MySQLServer_BkpRentionPeriod" {
  type        = number
  default     = 7
  description = "Backup retention days for the server, supported values are between 7 and 35 days."
}
variable "MySQLServer_GeoRedunBkpEnabled" {
  type        = bool
  default     = false
  description = "Turn Geo-redundant server backups on/off. This allows you to choose between locally redundant or geo-redundant backup storage in the General Purpose and Memory Optimized tiers."
}
variable "MySQLServer_InfraEncryptionEnabled" {
  type        = bool
  default     = false
  description = "Whether or not infrastructure is encrypted for this server. Defaults to false. Changing this forces a new resource to be created."
}
variable "MySQLServer_PubNetworkAccessEnabled" {
  type        = bool
  default     = true
  description = "Whether or not public network access is allowed for this server. Defaults to true."
}
variable "MySQLServer_SSLEnforcementEnabled" {
  type        = bool
  default     = true
  description = "Specifies if SSL should be enforced on connections. Possible values are true and false"
}
variable "MySQLServer_SSLVersion" {
  type        = string
  default     = "TLS1_2"
  description = "The minimum TLS version to support on the sever. Possible values are TLSEnforcementDisabled, TLS1_0, TLS1_1, and TLS1_2"
}
variable "location" {
  type        = string
  default     = "eastus2"
  description = "MySQL server deployment location"
  validation {
    condition     = contains(["eastus2", "centralus", "westus2"], lower(var.location))
    error_message = "Unsupported Azure Region specified for MySQL Server. Only United States Azure Regions are supported."
  }
}
variable "rg_Name" {
  type        = string
  default     = ""
  description = "Resource group name to deploy the resources"
}
#variable "SQLDB_MaxSize" {
#type = number
#default = 1000000
#description = "Value of SQL DB Max size in bytes"
#}