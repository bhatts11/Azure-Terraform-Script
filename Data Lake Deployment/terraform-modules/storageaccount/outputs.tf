output "storage_account_id" {
  value = azurerm_storage_account.saName.id
}

output "storage_account_blobendpoint" {
  value = azurerm_storage_account.saName.primary_blob_endpoint
}

output "storage_account_primary_connection_string" {
  value = azurerm_storage_account.saName.primary_connection_string
}

output "storage_account_secondary_connection_string" {
  value = azurerm_storage_account.saName.secondary_connection_string
}

output "storage_account_primary_access_key" {
  value = azurerm_storage_account.saName.primary_access_key
}

output "storage_account_secondary_access_key" {
  value = azurerm_storage_account.saName.secondary_access_key
}