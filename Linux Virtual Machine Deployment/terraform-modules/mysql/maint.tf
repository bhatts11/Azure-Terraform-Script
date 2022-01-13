resource "azurerm_mysql_server" "mysql_server" {
  name                              = var.MySQLServer_Name
  location                          = var.location
  resource_group_name               = var.rg_Name
  administrator_login               = var.MySQLServer_AdminUserName
  administrator_login_password      = var.MySQLServer_AdminUserPasswd
  sku_name                          = var.MySQLServerSKU_Name
  storage_mb                        = var.MySQLServerStorageSize
  version                           = var.MySQLServer_Version
  auto_grow_enabled                 = var.MySQLServer_StorageAutoGrowEnabled
  backup_retention_days             = var.MySQLServer_BkpRentionPeriod
  geo_redundant_backup_enabled      = var.MySQLServer_GeoRedunBkpEnabled
  infrastructure_encryption_enabled = var.MySQLServer_InfraEncryptionEnabled
  public_network_access_enabled     = var.MySQLServer_PubNetworkAccessEnabled
  ssl_enforcement_enabled           = var.MySQLServer_SSLEnforcementEnabled
  ssl_minimal_tls_version_enforced  = var.MySQLServer_SSLVersion
}