resource "azurerm_api_management" "apim_service" {
  name                = var.apim_service
  location            = var.location
  resource_group_name = var.rg_Name
  publisher_name      = var.apim_publisher
  publisher_email     = var.apim_publisher_email
  sku_name            = var.apim_sku

  policy {
    xml_content = <<XML
    <policies>
      <inbound />
      <backend />
      <outbound />
      <on-error />
    </policies>
XML
  }
}
