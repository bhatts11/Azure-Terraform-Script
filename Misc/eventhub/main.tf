resource "azurerm_eventhub_cluster" "eventhub_cluster" {
  name                = var.ehcluster
  resource_group_name = var.rg_Name
  location            = var.location
  sku_name            = var.eh_sku
}

resource "azurerm_eventhub_namespace" "eventhub_namespace" {
  name                 = var.ehnamespace
  location             = var.location
  resource_group_name  = var.rg_Name
  sku                  = var.eh_namespace_sku
  dedicated_cluster_id = azurerm_eventhub_cluster.eventhub_cluster.id
}

resource "azurerm_eventhub" "eventhub" {
  name                = var.eventhub
  resource_group_name = var.rg_Name
  namespace_name      = azurerm_eventhub_namespace.eventhub_namespace.name
  partition_count     = var.eventhub_partition_count
  message_retention   = var.msg_retention
}