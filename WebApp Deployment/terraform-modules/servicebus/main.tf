resource "azurerm_servicebus_namespace" "sbnamespace" {
  name                = var.sbnamespace
  location            = var.location
  resource_group_name = var.rg_Name
  sku                 = var.sbsku
}

resource "azurerm_servicebus_namespace_authorization_rule" "sbnauth" {
  name                = var.sbnauth
  namespace_name      = azurerm_servicebus_namespace.sbnamespace.name
  resource_group_name = var.rg_Name
  send                = true
  listen              = true
  manage              = true
}

resource "azurerm_servicebus_topic" "sbtopic" {
  name                = var.sbtopic
  resource_group_name = var.rg_Name
  namespace_name      = azurerm_servicebus_namespace.sbnamespace.name
  enable_partitioning = true
}

resource "azurerm_servicebus_subscription" "sbsubscription" {
  name                = var.sbsubscription
  resource_group_name = var.rg_Name
  namespace_name      = azurerm_servicebus_namespace.sbnamespace.name
  topic_name          = azurerm_servicebus_topic.sbtopic.name
  max_delivery_count  = 1
}

resource "azurerm_servicebus_queue" "sbqueue" {
  name                = var.sbqueue
  resource_group_name = var.rg_Name
  namespace_name      = azurerm_servicebus_namespace.sbnamespace.name
  enable_partitioning = true
}