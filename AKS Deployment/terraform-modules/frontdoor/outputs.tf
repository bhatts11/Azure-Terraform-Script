output "front_door_id" {
  value = azurerm_frontdoor.front_door.id
}

output "fd_backend_pool_id" {
  value = azurerm_frontdoor.front_door.backend_pool.*.id
}