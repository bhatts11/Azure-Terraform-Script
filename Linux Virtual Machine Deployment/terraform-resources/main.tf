# backend storageaccount declaration to store the terraform state file. This should exist already.
terraform {
  backend "azurerm" {
    #   subscription_id       = "da74xxxx-9c9a-xxxx-8fae-xxxxxxxxxxxx"
    subscription_id      = "aa01771c-5ab3-4809-b7e6-30c8080fc4ee"
    resource_group_name  = "Terraform_Backend_RG"
    storage_account_name = "terraformbackend02938" # Storage account used for backend
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

### Data source for KV - to retrive the secrets from KV, declaring the existing KV details.
data "azurerm_key_vault" "kv_name" {
  name                = var.devKV_Name
  resource_group_name = var.rg_Name
}
## To get object & tenant ID , declaring the data source. 
data "azurerm_client_config" "current" {}

#############################################################################

############# 1. VNET & SUBNET Deployment Code #############

module "vnet01" {
  source             = "../terraform-modules/network"
  vnet_Name          = var.vnet_Name
  rg_Name            = var.rg_Name
  location           = var.location
  vnet_Address       = var.vnet_Address
  subnet_NameList    = var.subnet_NameList
  subnet_AddressList = var.subnet_AddressList
}

#############################################################################

# ######## 2. APP Gateway Deployment Code ###########

module "app_gateway" {
  depends_on                 = [module.vnet01.subnet]
  source                     = "../terraform-modules/appgateway"
  location                   = var.location
  rg_Name                    = var.rg_Name
  appgtwy_PublicIPName       = var.appgtwy_PublicIPName
  appgtwy_AllocationMethod   = var.appgtwy_AllocationMethod
  appgtwy_PipSKU             = var.appgtwy_PipSKU
  appgtwy_MSIName            = var.appgtwy_MSIName
  appgtwy_BackendAddressPool = var.appgtwy_BackendAddressPool
  appgtwy_FrontEndPort       = var.appgtwy_FrontEndPort
  appgtwy_FrondEndIPConfig   = var.appgtwy_FrondEndIPConfig
  appgtwy_HttpSetting        = var.appgtwy_HttpSetting
  appgtwy_ListenrHttp        = var.appgtwy_ListenrHttp
  appgtwy_RequetRoutingRule  = var.appgtwy_RequetRoutingRule
  appgtwy_RedirectConfig     = var.appgtwy_RedirectConfig
  appgtwy_Name               = var.appgtwy_Name
  appgtwy_SKUName            = var.appgtwy_SKUName
  appgtwy_SKUTier            = var.appgtwy_SKUTier
  appgtwy_CapacityMin        = var.appgtwy_CapacityMin
  appgtwy_CapacityMax        = var.appgtwy_CapacityMax
  appgtwy_IdentityType       = var.appgtwy_IdentityType
  appgtwy_IPConfig           = var.appgtwy_IPConfig
  appgtwy_subnet_id          = module.vnet01.subnet_Id[1]
}

#######################################################

######## 3. Frontdoor Deployment Code ###########
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

######## 4. KEY Vault Deployment Code ###########

module "key_vault" {
  source        = "../terraform-modules/keyvault"
  keyvalut_Name = var.keyvalut_Name
  rg_Name       = var.rg_Name
  location      = var.location
  keyvalut_SKU  = var.keyvalut_SKU
}

#######################################################

######## 5. StorageAccount Deployment Code ###########

module "storage_account" {
  source                         = "../terraform-modules/storageaccount"
  storageaccount_Name            = var.storageaccount_Name
  storageaccount_Tier            = var.storageaccount_Tier
  storageaccount_Kind            = var.storageaccount_Kind
  storageaccount_ReplicationType = var.storageaccount_ReplicationType
  rg_Name                        = var.rg_Name
  location                       = var.location
  storageaccount_ContainerName   = var.storageaccount_ContainerName
}

#######################################################
data "azurerm_key_vault_secret" "mysql_admin_sec" {
  name         = var.sqlkv_AdmUsrPasswd
  key_vault_id = data.azurerm_key_vault.kv_name.id
}

######## 6. MySQL Server Deployment ###########
module "mysql_server" {
  source                              = "../terraform-modules/mysql"
  MySQLServer_Name                    = var.MySQLServer_Name
  location                            = var.location
  rg_Name                             = var.rg_Name
  MySQLServer_AdminUserName           = var.MySQLServer_AdminUserName
  MySQLServer_AdminUserPasswd         = data.azurerm_key_vault_secret.mysql_admin_sec.value
  MySQLServer_Version                 = var.MySQLServer_Version
  MySQLServerStorageSize              = var.MySQLServerStorageSize
  MySQLServerSKU_Name                 = var.MySQLServerSKU_Name
  MySQLServer_StorageAutoGrowEnabled  = var.MySQLServer_StorageAutoGrowEnabled
  MySQLServer_BkpRentionPeriod        = var.MySQLServer_BkpRentionPeriod
  MySQLServer_GeoRedunBkpEnabled      = var.MySQLServer_GeoRedunBkpEnabled
  MySQLServer_InfraEncryptionEnabled  = var.MySQLServer_InfraEncryptionEnabled
  MySQLServer_PubNetworkAccessEnabled = var.MySQLServer_PubNetworkAccessEnabled
  MySQLServer_SSLEnforcementEnabled   = var.MySQLServer_SSLEnforcementEnabled
  MySQLServer_SSLVersion              = var.MySQLServer_SSLVersion
}

module "mysql_db" {
  depends_on       = [module.mysql_server]
  source           = "../terraform-modules/mysqldb"
  MySQLDB_Name     = var.MySQLDB_Name
  MySQLServer_Name = var.MySQLServer_Name
  rg_Name          = var.rg_Name
  MySQLCharSet     = var.MySQLCharSet
  MySQlCollection  = var.MySQlCollection
}

######## 7. Azure SQL Server Deployment ###########

data "azurerm_key_vault_secret" "sql_admin_user" {
  name         = var.sqlkv_AdmUsr
  key_vault_id = data.azurerm_key_vault.kv_name.id
}

data "azurerm_key_vault_secret" "sql_admin_passwd" {
  name         = var.sqlkv_AdmPasswd
  key_vault_id = data.azurerm_key_vault.kv_name.id
}

module "sqlserver" {
  source        = "../terraform-modules/sql"
  sqlservername = var.sqlservername
  rg_Name       = var.rg_Name
  location      = var.location
  sql_version   = var.sql_version
  sql_user      = data.azurerm_key_vault_secret.sql_admin_user.value
  sql_password  = data.azurerm_key_vault_secret.sql_admin_passwd.value
  mssqldb       = var.mssqldb
  #mssql_serverid      = module.sqlserver.id
  sql_collation       = var.sql_collation
  sql_license_type    = var.sql_license_type
  sql_db_max_size     = var.sql_db_max_size
  sql_sku_name        = var.sql_sku_name
  short_term_ret_days = var.short_term_ret_days
  weekly_retention    = var.weekly_retention
  monthly_retention   = var.monthly_retention
  yearly_retention    = var.yearly_retention
  week_of_year        = var.week_of_year

}

######### 8. Azure Linux Virtual Machine deployment #########

data "azurerm_key_vault_secret" "virtual_machine_user" {
  name         = var.virtual_machine_Usr
  key_vault_id = data.azurerm_key_vault.kv_name.id
}

data "azurerm_key_vault_secret" "virtual_machine_passwd" {
  name         = var.virtual_machine_Passwd 
  key_vault_id = data.azurerm_key_vault.kv_name.id
}

module "linux_vm" {
  depends_on           = [module.vnet01.subnet]
  source               = "../terraform-modules/virtual_machine"
  vm_pip               = var.vm_pip
  rg_Name              = var.rg_Name
  location             = var.location
  pip_allocation       = var.pip_allocation
  vm_nic               = var.vm_nic
  ip_configuration     = var.ip_configuration
  vm_name              = var.vm_name
  vm_size              = var.vm_size
  vm_username          = data.azurerm_key_vault_secret.virtual_machine_user.value
  vm_password          = data.azurerm_key_vault_secret.virtual_machine_passwd.value
  vm_image_publisher   = var.vm_image_publisher
  vm_image_offer       = var.vm_image_offer
  vm_image_sku         = var.vm_image_sku
  vm_image_version     = var.vm_image_version
  vm_os_disk_strg_type = var.vm_os_disk_strg_type
  vm_os_disk_caching   = var.vm_os_disk_caching
  vm_subnetid          = module.vnet01.subnet_Id[3]
}