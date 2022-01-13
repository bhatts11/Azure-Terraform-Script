subscription_id = "aa01771c-5ab3-4809-b7e6-30c8080fc4ee"
## Pre Defined KV for storing secret
devKV_Name         = "iac-test-kv-east"   #### We have to change as per env
akskv_SPClientID   = "spclientid"         ## SP Client ID - replace with created secret name
akskv_SPClientSec  = "spclientsec"        ## SP Client Secret - replace with created secret name
sqlkv_AdmUsrPasswd = "mysqladmuserpasswd" ## MySQL Server Admin user password - replace with created secret name
## VNET - SUBNET
rg_Name            = "Demo_RG" ## We have to change as per env
location           = "eastus2"
vnet_Name          = "vnet-terraform-modulesdev-eus2"
vnet_Address       = "178.29.192.0/20"
subnet_NameList    = ["snet-aks-terraform-modulesdev-eus2", "snet-agw-terraform-modulesdev-eus2", "snet-shared-terraform-modulesdev-eus2", "snet-vm-terraform-modulesdev-eus2", "GatewaySubnet"]
subnet_AddressList = ["178.29.192.0/26", "178.29.192.64/26", "178.29.192.128/26", "178.29.192.192/26", "178.29.193.0/26"]

### For APP GWY                = ###
appgtwy_PublicIPName       = "pip-agw-terraform-modulesdev-eus2"
appgtwy_AllocationMethod   = "Static"
appgtwy_PipSKU             = "Standard"
appgtwy_MSIName            = "mi-devapp"
appgtwy_BackendAddressPool = "agw-terraform-modulesdev-backend-address-pool"
appgtwy_FrontEndPort       = "agw-terraform-modulesdev-frontend-port"
appgtwy_FrondEndIPConfig   = "agw-terraform-modulesdev-frontend-ip-config"
appgtwy_HttpSetting        = "agw-terraform-modulesdev-http-setting"
appgtwy_ListenrHttp        = "agw-terraform-modulesdev-listner"
appgtwy_RequetRoutingRule  = "agw-terraform-modulesdev-request-routing-rule"
appgtwy_RedirectConfig     = "agw-terraform-modulesdev-redirect-config"
appgtwy_Name               = "agw-terraform-modulesdev-eus2"
#appgtwy_Zones                  = ["1", "2", "3"]
appgtwy_SKUName      = "Standard_v2"
appgtwy_SKUTier      = "Standard_v2"
appgtwy_CapacityMin  = 1
appgtwy_CapacityMax  = 2
appgtwy_IdentityType = "UserAssigned"
appgtwy_IPConfig     = "agw-terraform-modulesdev-ip-configuration"

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

### Key Vault                  = ###
keyvalut_Name = "kv-terra-dev-eus2-01"
keyvalut_SKU  = "standard"


##
### For MySQL Server
MySQLServer_Name          = "mysqlt-terraform-modulesdev-eus2"
MySQLServer_AdminUserName = "mysqladmin"
#MySQLServer_AdminUserPasswd        = "" ## This should be fetched from KV
MySQLServer_Version                 = "8.0"
MySQLServerStorageSize              = 102400     ## equalent to 100GB
MySQLServerSKU_Name                 = "B_Gen5_2" ## "GP_Gen5_4" , "GP_Gen5_8"
MySQLServer_StorageAutoGrowEnabled  = true
MySQLServer_BkpRentionPeriod        = 7     ## Allowed values 7 & 35 
MySQLServer_GeoRedunBkpEnabled      = false ## For basic SKU, this is not support
MySQLServer_InfraEncryptionEnabled  = false
MySQLServer_PubNetworkAccessEnabled = true
MySQLServer_SSLEnforcementEnabled   = true
MySQLServer_SSLVersion              = "TLS1_2"
MySQLDB_Name                        = "terraform-devmysqldb"
MySQLCharSet                        = "utf8"
MySQlCollection                     = "utf8_unicode_ci"

### StorageAccount             = ###
storageaccount_Name            = "stadeveus2"
storageaccount_Tier            = "Standard"
storageaccount_Kind            = "StorageV2"
storageaccount_ReplicationType = "LRS"
storageaccount_ContainerName   = "devdata"

### SQL Server deployment
sqlservername = "sushterratest"
sql_version   = "12.0"
# sql_user        = var.sql_user # This will be fetched from key vault using data source
# sql_password    = var.sql_password # This will be fetched from key vault using data source
sqlkv_AdmUsr    = "sqluser"     # Name of the key vault secret used to store User name
sqlkv_AdmPasswd = "sqlpassword" # Name of the key vault secret used to store SQL Password

### SQL Database deployment

mssqldb             = "testterradevdb"
sql_collation       = "SQL_Latin1_General_CP1_CI_AS"
sql_license_type    = "LicenseIncluded"
sql_db_max_size     = 4
sql_sku_name        = "BC_Gen5_2"
short_term_ret_days = 15
weekly_retention    = "P7D"
monthly_retention   = "P1M"
yearly_retention    = "P365D"
week_of_year        = 4

### Linux Virtual Machine Deployment

virtual_machine_Usr    = "virtual-machine-user"
virtual_machine_Passwd = "virtual-machine-password"
vm_pip                 = "public_ip_win"
pip_allocation         = "Dynamic"
vm_nic                 = "win_vm_nic"
ip_configuration       = "ip_config"
vm_name                = "win-terra-vm"
vm_size                = "Standard_B2s"
vm_username            = "" ## Fetched from KV.
vm_password            = "" ## Fetched from KV.
vm_image_publisher     = "MicrosoftWindowsServer"
vm_image_offer         = "WindowsServer"
vm_image_sku           = "2016-Datacenter"
vm_image_version       = "latest"
vm_os_disk_strg_type   = "Standard_LRS"
vm_os_disk_caching     = "ReadWrite"

#### VMSS Deployment ####

# vmss_Usr = 
# vmss_Passwd = 
vmss_pip_prefix          = "vmss-pip"
vmss_name                = "terratest-vmss"
vmss_instance            = "3"
prefix                   = "win-vmss"
vmss_zones               = [1, 2, 3]
vmss_image_publisher     = "MicrosoftWindowsServer"
vmss_image_offer         = "WindowsServer"
vmss_image_sku           = "2019-Datacenter"
vmss_image_version       = "latest"
vmss_storage_acc_type    = "Standard_LRS"
vmss_os_disk_caching     = "ReadWrite"
vmss_auto_config         = "autoscale-config"
vmss_def_count           = 3
vmss_max_count           = 5
vmss_min_count           = 1
vmss_cpu_upper_threshold = 75
vmss_cpu_lower_threshold = 25