##Public IP Creation:
resource "azurerm_public_ip" "agwpip" {
  name                = var.appgtwy_PublicIPName
  location            = var.location
  resource_group_name = var.rg_Name
  allocation_method   = var.appgtwy_AllocationMethod
  sku                 = var.appgtwy_PipSKU
}

# - Managed Service Identity
resource "azurerm_user_assigned_identity" "agw_msi" {
  location            = var.location
  resource_group_name = var.rg_Name
  name                = var.appgtwy_MSIName
}

locals {
  backend_address_pool_name      = var.appgtwy_BackendAddressPool
  frontend_port_name             = var.appgtwy_FrontEndPort
  frontend_ip_configuration_name = var.appgtwy_FrondEndIPConfig
  http_setting_name              = var.appgtwy_HttpSetting
  listener_name                  = var.appgtwy_ListenrHttp
  request_routing_rule_name      = var.appgtwy_RequetRoutingRule
  redirect_configuration_name    = var.appgtwy_RedirectConfig
}

resource "azurerm_application_gateway" "appgw" {
  #depends_on          = [ module.vnet.subnet ]
  name                = var.appgtwy_Name
  location            = var.location
  resource_group_name = var.rg_Name
  enable_http2        = false
  #zones               = var.appgtwy_Zones

  sku {
    name = var.appgtwy_SKUName
    tier = var.appgtwy_SKUTier
  }

  autoscale_configuration {
    min_capacity = var.appgtwy_CapacityMin
    max_capacity = var.appgtwy_CapacityMax
  }

  identity {
    type         = var.appgtwy_IdentityType
    identity_ids = [azurerm_user_assigned_identity.agw_msi.id]
  }

  gateway_ip_configuration {
    name      = var.appgtwy_IPConfig
    subnet_id = var.appgtwy_subnet_id
  }

  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.agwpip.id
  }

  frontend_port {
    name = "https_port"
    port = 443
  }

  frontend_port {
    name = local.frontend_port_name
    port = 80
  }

  backend_address_pool {
    name = local.backend_address_pool_name
  }

  backend_http_settings {
    name                  = local.http_setting_name
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }

  http_listener {
    name                           = local.listener_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Http"
  }
  request_routing_rule {
    name                       = local.request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = local.listener_name
    backend_address_pool_name  = local.backend_address_pool_name
    backend_http_settings_name = local.http_setting_name
  }

}