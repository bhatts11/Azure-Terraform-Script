resource "azurerm_frontdoor" "front_door" {
  name                                         = var.FrontDoor_Name
  resource_group_name                          = var.rg_Name
  enforce_backend_pools_certificate_name_check = false

  routing_rule {
    name               = var.FD_RoutingRuleName
    accepted_protocols = ["Http", "Https"]
    patterns_to_match  = ["/*"]
    frontend_endpoints = [var.FD_FrontEndPointName]
    forwarding_configuration {
      forwarding_protocol = var.FD_forwdProtocal
      backend_pool_name   = var.FD_BackendPoolName
    }
  }

  backend_pool_load_balancing {
    name = var.FD_BackendLBName
  }

  backend_pool_health_probe {
    name = var.FD_BackendPoolHealthProbeName
  }

  backend_pool {
    name = var.FD_BackendPoolName
    backend {
      host_header = var.FD_BackendPoolHost
      address     = var.FD_BackendPoolHostAddress
      http_port   = 80
      https_port  = 443
    }

    load_balancing_name = var.FD_BackendLBName
    health_probe_name   = var.FD_BackendPoolHealthProbeName
  }

  frontend_endpoint {
    name                              = var.FD_FrontEndPointName
    host_name                         = var.FD_FrontEndHostName
    custom_https_provisioning_enabled = false
  }
}