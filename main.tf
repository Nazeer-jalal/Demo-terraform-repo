provider "azurerm" {
  features {}
  
  subscription_id = ""
}

resource "azurerm_resource_group" "rg7" {
  name = "naz-rg7"
  location = "east us"
}

resource "azurerm_virtual_network" "vnet1" {
  name = "naz-vnet1"
  location = azurerm_resource_group.rg7.location
  address_space = [ "172.16.0.0/16" ]
  resource_group_name = azurerm_resource_group.rg7.name
}

resource "azurerm_subnet" "subnet1" {
  name = "vm-sub"
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes = [ "172.16.0.0/24" ]
  resource_group_name = azurerm_resource_group.rg7.name
}