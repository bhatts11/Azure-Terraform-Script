output "appgw_id" {
  description = "The ID of the Application Gateway."
  value       = azurerm_application_gateway.appgw.id
}

output "appgw_name" {
  description = "The name of the Application Gateway."
  value       = azurerm_application_gateway.appgw.name
}


output "appgw_public_ip_address" {
  description = "The public IP address of Application Gateway."
  value       = azurerm_public_ip.agwpip.ip_address
}

output "appgw_backend_address_pool_ids" {
  description = "List of backend address pool Ids."
  value       = azurerm_application_gateway.appgw.backend_address_pool.*.id
}
