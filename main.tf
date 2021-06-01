resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_cdn_profile" "example" {
  name                = "example-cdn"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  sku                 = "Standard_Verizon"
}

resource "azurerm_cdn_endpoint" "example" {
  name                = "robertdebock"
  profile_name        = azurerm_cdn_profile.example.name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  origin {
    name      = "example"
    host_name = "robertdebock.nl"
  }
}
