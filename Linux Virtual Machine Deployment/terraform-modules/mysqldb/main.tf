resource "azurerm_mysql_database" "mysql_db" {
  name                = var.MySQLDB_Name
  resource_group_name = var.rg_Name
  server_name         = var.MySQLServer_Name
  charset             = var.MySQLCharSet
  collation           = var.MySQlCollection
}