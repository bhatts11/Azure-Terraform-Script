resource "azurerm_storage_account" "saName" {
  name                      = var.storageaccount_Name
  resource_group_name       = var.rg_Name
  location                  = var.location
  account_tier              = var.storageaccount_Tier
  account_kind              = var.storageaccount_Kind
  account_replication_type  = var.storageaccount_ReplicationType
  allow_blob_public_access  = false
  enable_https_traffic_only = true
}
resource "azurerm_storage_container" "SAcontainerName" {
  name                  = var.storageaccount_ContainerName
  storage_account_name  = azurerm_storage_account.saName.name
  container_access_type = "private"
}