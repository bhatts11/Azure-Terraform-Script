# Create the Linux App Service Plan
resource "azurerm_app_service_plan" "appserviceplan" {
  name                = var.app_plan_name
  location            = var.location
  resource_group_name = var.rg_Name
  kind                = var.appsvcplan_kind
  sku {
    tier = var.appservice_tier
    size = var.appservice_size
  }
}

# Create the web app, pass in the App Service Plan ID, and deploy code from a public GitHub repo
resource "azurerm_app_service" "webapp" {
  name                = var.web_app_name
  location            = var.location
  resource_group_name = var.rg_Name
  app_service_plan_id = azurerm_app_service_plan.appserviceplan.id

  # Since this varies based on the runtime being used these values need to be changed based on the requirement :
  # Please refer https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service#acr_use_managed_identity_credentials for detailed options.
  site_config {
    java_version           = "1.8"
    java_container         = "JETTY"
    java_container_version = "9.3"
  }

  # Required if using windows_fx_version or linux_fx_version in site_config section
  #     app_settings = {
  #     "DOCKER_REGISTRY_SERVER_URL"      = "https://mcr.microsoft.com",
  #     "DOCKER_REGISTRY_SERVER_USERNAME" = "",
  #     "DOCKER_REGISTRY_SERVER_PASSWORD" = "",
  #   }

  #  source_control {
  #    repo_url           = "https://github.com/Azure-Samples/nodejs-docs-hello-world"
  #    branch             = "master"
  #    manual_integration = true
  #    use_mercurial      = false
  #  }

}