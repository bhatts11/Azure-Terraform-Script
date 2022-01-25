# NOTE: the Name used for Redis needs to be globally unique
resource "azurerm_redis_cache" "redis_cache" {
  name                = var.redis_cache
  location            = var.location
  resource_group_name = var.rg_Name
  capacity            = var.redis_capacity
  family              = var.redis_family
  sku_name            = var.redis_sku
  enable_non_ssl_port = var.non_ssl_port_redis
  minimum_tls_version = var.min_tls_redis

  redis_configuration {}
}