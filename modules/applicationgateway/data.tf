data "azurerm_resource_group" "vnetrg" {
  name = "elite-vnetdevrg"
}

data "azurerm_virtual_network" "vnetname" {
  name                = "elite-vnetdev"
  resource_group_name = "elite-vnetdevrg"
}