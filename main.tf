module "database" {

  source                       = "./modules/database/"
  dbRGname                     = "databaseRG"
  server                       = lower("ELITE")
  buildregion                  = upper("centralus")
  storageaccount               = join("", ["devstorage"])
  sqlserver                    = "sqladmin"
  administrator_login          = "sqladmin"
  dbname                       = "devdatabase"
  fwRulename                   = "dbfwRule"
  start_ip_address             = "82.76.59.177"
  end_ip_address               = "82.76.59.177"
  administrator_login_password = var.administrator_login_password

  # depends_on = [azurerm_resource_group.rg]
}

module "virtualnetwork" {

  source              = "./modules/virtualnetwork/"
  vnet_name           = join("-", ["elite", "vnetdev"])
  tags                = local.network_tag
  subnet_names        = local.subnet_names
  address_space       = local.address_space
  subnet_prefixes     = local.subnet_prefixes
  resource_group_name = local.resource_group_name
  route_tables_ids = {
    application = azurerm_route_table.rtb.id
    database    = azurerm_route_table.rtb.id
    servers     = azurerm_route_table.rtb.id
  }
    nsg_ids = {
    application = azurerm_network_security_group.nsg.id
    database    = azurerm_network_security_group.nsg.id
    servers     = azurerm_network_security_group.nsg.id
  }

  depends_on = [azurerm_resource_group.vnetrg]
}