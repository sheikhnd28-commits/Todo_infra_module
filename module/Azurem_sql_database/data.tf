data "azurerm_mssql_server" "servers" {
  for_each = var.sqldb

  name      = each.value.server_name
  resource_group_name = each.value.resource_group_name

}