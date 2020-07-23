
resource "azurerm_storage_account" "strgacccitrix" {
  name                = "strgacccitrix"
  resource_group_name = azurerm_resource_group.citrixrg.name

  location                 = azurerm_resource_group.citrixrg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

 # network_rules {
 #   default_action             = "Deny"
 #   ip_rules                   = ["100.0.0.1"]
 #   virtual_network_subnet_ids = [azurerm_subnet.example.id]
 # }
}


resource "azurerm_storage_account" "strgacccitrixireland" {
  name                = "strgacccitrixireland"
  resource_group_name = azurerm_resource_group.citrixrg-ireland.name

  location                 = azurerm_resource_group.citrixrg-ireland.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

 # network_rules {
 #   default_action             = "Deny"
 #   ip_rules                   = ["100.0.0.1"]
 #   virtual_network_subnet_ids = [azurerm_subnet.example.id]
 # }
}

resource "azurerm_storage_account" "strgacccitrixparis" {
  name                = "strgacccitrixparis"
  resource_group_name = azurerm_resource_group.citrixrg-paris.name

  location                 = azurerm_resource_group.citrixrg-paris.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

 # network_rules {
 #   default_action             = "Deny"
 #   ip_rules                   = ["100.0.0.1"]
 #   virtual_network_subnet_ids = [azurerm_subnet.example.id]
 # }
}
