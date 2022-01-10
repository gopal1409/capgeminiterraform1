#Resource create a virtual network. 
resource "azurerm_virtual_network" "myvnet" {
  name                = "myvnet-1"
  location            = azurerm_resource_group.my_demo_rg1.location
  resource_group_name = azurerm_resource_group.my_demo_rg1.name
  address_space       = ["10.0.0.0/16"]
}

#create subnet 
resource "azurerm_subnet" "mysubnet" {
  name                 = "mysubnet-1"
  resource_group_name = azurerm_resource_group.my_demo_rg1.name
  virtual_network_name = azurerm_virtual_network.myvnet.name
  address_prefixes     = ["10.0.1.0/24"]
}
#create public ip
resource "azurerm_public_ip" "mypublicip" {
  name                = "mypublicip-1"
  resource_group_name = azurerm_resource_group.my_demo_rg1.name
  location            = azurerm_resource_group.my_demo_rg1.location
  allocation_method   = "Static" #static or dynamic

  tags = {
    environment = "Dev"
  }
}
#create the network interface
resource "azurerm_network_interface" "myvm1nic" {
  name                = "vm1-nic"
  resource_group_name = azurerm_resource_group.my_demo_rg1.name
  location            = azurerm_resource_group.my_demo_rg1.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.mysubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.mypublicip.id
  }
}
