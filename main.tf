terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.46.0"
    }
  }
}

provider "azurerm" {
  features {}
}


# locals {

#   csv_data = <<-CSV
#     Geo,Name,Location
#     Europe,pod1,UK South
#     America,pod1,East Asia
#     Asia,pod1,East US
#   CSV

#   instances = csvdecode(local.csv_data)
# }

resource "azurerm_resource_group" "production_rg" {
 for_each = { for inst in local.instances : inst.Geo => inst }
  name     = each.value.Name
  location = each.value.Location
}

     

