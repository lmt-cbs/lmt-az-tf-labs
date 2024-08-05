# main.tf

# Specify the provider
provider "azurerm" {
  features {}
}

# Define the resource group
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

# Using the DevTest Labs module from the Terraform Registry
module "devtest_lab" {
  source              = "Azure/devtest-lab/azurerm"
  version             = "1.0.0"  # You may need to update to the latest version available

  # Basic configurations
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  lab_name            = "example-devtest-lab"

  # Additional configurations can be specified as needed
  storage_type             = "Standard"
  artifact_storage_account = "exampleartifactstorage"
}

# Output the lab name
output "lab_name" {
  value = module.devtest_lab.name
}
