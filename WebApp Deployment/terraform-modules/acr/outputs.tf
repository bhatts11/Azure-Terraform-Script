output "container_id" {
  value = azurerm_container_registry.container_registery.id
}
/*
output "acr_pe_id" {
    value = azurerm_private_endpoint.acepe01.id
}
output "acr_pe_ip" {
    value = azurerm_private_endpoint.acepe01.private_service_connection[0].private_ip_address
}
*/