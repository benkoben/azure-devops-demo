terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.97.0"
    }
  }
  backend "azurerm" {}
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  skip_provider_registration = true
  features {}

  subscription_id = var.primary_azure_subscription_id
  client_id       = var.primary_azure_client_id
  client_secret   = var.primary_azure_client_secret
  tenant_id       = var.primary_azure_tenant_id
}