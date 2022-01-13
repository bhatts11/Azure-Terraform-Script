## Subscription ID, Resource Group and Location set. These are kept universal in this code. ####
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

### VNET Module Variables Start ###

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

#### Variables for Application gateway Module defined here ####
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

#### Variables for Key vault Module defined here #### 

variable "keyvalut_Name" {
  type    = string
  default = ""
}
variable "keyvalut_SKU" {
  type    = string
  default = ""
}
#### Variables for Storage account Module defined here ####

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
#### Variables for Front Door Module defined here ####

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
#### Variables for MySQL Module defined here ####
variable "MySQLServer_Name" {
  type        = string
  default     = ""
  description = "MySQL Server name to deploy"
}
variable "MySQLServer_Version" {
  type        = string
  default     = ""
  description = "SQL Server version value"
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
variable "MySQLServer_AdminUserName" {
  type        = string
  default     = "mysqladmin"
  description = "MySQL Server Admin user - this will be fetched from kv secrets"
}
variable "MySQLServer_AdminUserPasswd" {
  type        = string
  sensitive   = true
  default     = "mysqladmin"
  description = "SQL Server Admin user password - this will be fetched from kv secrets"
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
  description = "Turn Geo-redundant server back  on/off. This allows you to choose between locally redundant or geo-redundant backup storage in the General Purpose and Memory Optimized tiers."
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
variable "MySQLDB_Name" {
  type        = string
  default     = "db01"
  description = "mysql db name to create for SQL Server"
}
variable "MySQLCharSet" {
  type        = string
  default     = ""
  description = "character set value to set for MySQL DB "
}
variable "MySQlCollection" {
  type        = string
  default     = ""
  description = "collaction value to set for MySQL DB "
}

#### Variables for SQL Module defined here ####

variable "sqlservername" {
  type        = string
  default     = ""
  description = "SQL Server name to be used."
}
variable "sql_version" {
  type        = string
  default     = ""
  description = "SQL Server version to be used"
}
variable "sql_user" {
  type        = string
  default     = ""
  description = "SQL Server login username - This will be fetched from KV secrets."
}
variable "sql_password" {
  type        = string
  default     = ""
  description = "SQL Server login password - This will be fetched from KV secrets."
}

variable "sqlkv_AdmUsr" {
  type        = string
  description = "SQL Server Username. This will be fetched from KV"
}
variable "sqlkv_AdmPasswd" {
  sensitive   = true
  type        = string
  description = "SQL Server Password. This will be fetched from KV"
}

variable "mssqldb" {
  type        = string
  default     = ""
  description = "SQL Database name"
}
variable "mssql_serverid" {
  type        = string
  default     = ""
  description = "SQL Server id for the SQL server to be used "
}
variable "sql_collation" {
  type        = string
  default     = "SQL_Latin1_General_CP1_CI_AS"
  description = "SQL database collation"
}
variable "sql_db_max_size" {
  type        = number
  default     = 4
  description = "The max size of the database in gigabytes."
}
variable "sql_sku_name" {
  type        = string
  default     = "BC_Gen5_2"
  description = "Specifies the name of the SKU used by the database"
}
variable "short_term_ret_days" {
  type        = number
  default     = 15
  description = "Point In Time Restore configuration. Value has to be between 7 and 35."
}
variable "weekly_retention" {
  type        = string
  default     = ""
  description = "The weekly retention policy for an LTR backup. Valid value is between 1 to 520 weeks. e.g. P1Y, P1M, P1W or P7D."
}
variable "monthly_retention" {
  type        = string
  default     = ""
  description = "The monthly retention policy for an LTR backup. Valid value is between 1 to 120 months. e.g. P1Y, P1M, P4W or P30D."
}
variable "yearly_retention" {
  type        = string
  default     = ""
  description = "The yearly retention policy for an LTR backup. Valid value is between 1 to 10 years. e.g. P1Y, P12M, P52W or P365D."
}

variable "week_of_year" {
  type        = number
  description = "The week of year to take the yearly backup. Value has to be between 1 and 52."
}

variable "sql_license_type" {
  type        = string
  default     = "LicenseIncluded"
  description = "Specifies the license type applied to this database. Possible values are LicenseIncluded and BasePrice."
}

#### Variables for Linux Virtual Module defined here ####

variable "vm_pip" {
  type        = string
  default     = ""
  description = "Name of the Public IP instance assigned to the Virtual Machine"
}
variable "pip_allocation" {
  type    = string
  default = ""
  validation {
    condition     = contains(["static", "dynamic"], lower(var.pip_allocation))
    error_message = "Public IP assignment can be either Static or Dynamic. Please correct your selection."
  }
  description = "Public IP assignment type"
}
variable "vm_nic" {
  type        = string
  default     = ""
  description = "Network Interface card name assigned to the Virtual Machine"
}

variable "ip_configuration" {
  type        = string
  default     = ""
  description = "IP configuration name for the Virtual Machine."
}
variable "vm_name" {
  type        = string
  default     = ""
  description = "Name of the Virtual Machine to be created."
}
variable "vm_size" {
  type        = string
  default     = ""
  description = "Virtual Machine \"Size\"SKU\" to be created such as : Standard_F2"
}
variable "vm_username" {
  type        = string
  default     = ""
  description = "Username for Azure Virtual Machine"
}
variable "vm_password" {
  type        = string
  default     = ""
  description = "Password for Azure Virtual Machine"
}

variable "vm_image_publisher" {
  type        = string
  default     = ""
  description = "Azure Virtual Machine Publisher such as : Canonical, RedHat, OpenLogic, etc."
}
variable "vm_image_offer" {
  type        = string
  default     = ""
  description = "Image Offer for the Publisher selected. Available options can be : UbuntuServer, RHEL, CentOS, etc."
}
variable "vm_image_sku" {
  type        = string
  default     = ""
  description = "Image Version or SKU for the publisher you have chosen. Such as 16.04-LTS for Ubuntu or 7_8-gen2 for CentOS, etc."
}
variable "vm_image_version" {
  type        = string
  default     = ""
  description = "This is the Image Version of the SKU that you have selected. Usually the selected option is \"Latest\". "
}
variable "vm_os_disk_strg_type" {
  type        = string
  default     = "Standard_LRS"
  description = "OS Disk Storage Type. Possible options are Standard_LRS, StandardSSD_LRS and Premium_LRS."
}

variable "vm_os_disk_caching" {
  type        = string
  default     = "ReadWrite"
  description = "The Type of Caching which should be used for the Internal OS Disk. Possible values are None, ReadOnly and ReadWrite."

}

variable "virtual_machine_Usr" {
  type        = string
  description = "Username for Azure Virtual Machine. This will be fetched from Key Vault."
}

variable "virtual_machine_Passwd" {
  type        = string
  description = "Password for Azure Virtual Machine. This will be fetched from Key Vault."
}

# variable "vm_subnetid" {
#   type        = string
#   description = "Subnet Id for the Virtual machine. This will be fetched from Network Module."
# }