#Terraform setting block(when we will do first time terraform init. using this seettign it will download all the plugin required to communcate with the cloud provider)
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.91.0"
    }
  }
}


#configure the azure provider
provider "azurerm" {
  features {}
}

#create the resource group

