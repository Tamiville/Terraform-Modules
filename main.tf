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

}