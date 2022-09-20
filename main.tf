terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
    }
  }
  backend "azurerm" {
    resource_group_name  = "terraform-demo"
    storage_account_name = "terraformdemostorage9105"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }
}
# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}


module "StorageAccount" {
  source = "./StorageAccount"
  base_name = "TerraformExample01"
  resource_group_name = "terraform-demo"
  location = "West US"
}
