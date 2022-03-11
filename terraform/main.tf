resource "azurerm_resource_group" "connectivity" {
  name     = "connectivity-weeu-${var.env}-001"
  location = var.location
}

resource "azurerm_virtual_network" "connectivity" {
  name                = "vnet-connectivityhub-weeu-${var.env}-001"
  location            = azurerm_resource_group.connectivity.location
  resource_group_name = azurerm_resource_group.connectivity.name
  address_space       = ["10.0.0.0/16"]

  subnet {
    name           = "snet-fwnet-weeu-001"
    address_prefix = "10.0.1.0/24"
  }
}
