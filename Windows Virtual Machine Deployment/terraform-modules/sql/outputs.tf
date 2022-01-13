output "database_name" {
  value = azurerm_mssql_database.mssqldb.name
}

output "sql_server_fqdn" {
  value = azurerm_mssql_server.sqlserver.fully_qualified_domain_name
}