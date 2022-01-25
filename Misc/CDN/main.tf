resource "azurerm_cdn_profile" "cdn-profile" {
  name                = var.cdn_profile_name
  location            = var.location
  resource_group_name = var.rg_Name
  sku                 = var.cdn_sku
}

resource "azurerm_cdn_endpoint" "cdn-endpoint" {
  name                = var.cdn_endpoint_name
  profile_name        = azurerm_cdn_profile.cdn-profile.name
  location            = var.location
  resource_group_name = var.rg_Name

  origin {
    name       = var.cdn_origin
    host_name  = var.cdn_host_name
    http_port  = 80
    https_port = 443
  }

}