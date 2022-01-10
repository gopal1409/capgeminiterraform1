#Resource create a virtual network. 
resource "azurerm_virtual_network" "myvnet" {
  name                = "myvnet-1"
  location            = azurerm_resource_group.my_demo_rg1.location
  resource_group_name = azurerm_resource_group.my_demo_rg1.name
  address_space       = ["10.0.0.0/16"]
}