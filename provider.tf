# Configure the Azure Provider
provider "azurerm" {
    version="1.38.0"
    skip_provider_registration=true
}

# create resource group
resource "azurerm_resource_group" "harbakshsingh" {
  name                = "harbakshsingh"
  location            = "uksouth"
}



resource "azurerm_virtual_network" "harbakshsingh-vnet" {
  name                = "harbakshsingh-vnet"
  location            = azurerm_resource_group.harbakshsingh.location
  resource_group_name =  "harbakshsingh"
  address_space       = [
              "10.0.0.0/24",
              "192.168.1.0/24",
              "10.1.0.0/24"
            ]
}

