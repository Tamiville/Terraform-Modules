#/==================================================\#
#***    Database Module ***#
#/==================================================\#

### Resource Group ##
resource "azurerm_resource_group" "rg" {
  name     = join("-", [local.server, var.dbRGname])
  location = local.buildregion
}

### Storage account ##
resource "azurerm_storage_account" "storageaccount" {
  name                     = join("", [local.server, var.storageaccount])
  location                 = azurerm_resource_group.rg.location
  resource_group_name      = azurerm_resource_group.rg.name
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
}

### MySQL Server ##
resource "azurerm_mssql_server" "sqlserver" {
  name                         = join("", [local.server, var.sqlserver])
  location                     = azurerm_resource_group.rg.location
  resource_group_name          = azurerm_resource_group.rg.name
  version                      = var.versionsql
  administrator_login          = join("", [local.server, var.administrator_login])
  administrator_login_password = var.administrator_login_password
}

resource "azurerm_mssql_database" "database" {
  name           = join("", [local.server, var.dbname])
  server_id      = azurerm_mssql_server.sqlserver.id
  collation      = var.collation
  license_type   = var.license_type
  read_scale     = var.read_scale
  zone_redundant = var.zone_redundant
  tags           = local.database_tags
}

resource "azurerm_mssql_firewall_rule" "fwRule" {
  name             = join("", [local.server, var.fwRulename])
  server_id        = azurerm_mssql_server.sqlserver.id
  start_ip_address = var.start_ip_address
  end_ip_address   = var.end_ip_address
}