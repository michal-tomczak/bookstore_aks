terraform {
  required_version = ">=1.0"

  required_providers {
    azapi = {
      source  = "azure/azapi"
      version = "~>1.5"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
    time = {
      source  = "hashicorp/time"
      version = "0.9.1"
    }
  }
  
  backend "azurerm" {
      resource_group_name  = "rg-bookstore"
      storage_account_name = "satomczak"
      container_name       = "tfstate"
      key                  = "terraform.tfstate"
      use_oidc             = true
  } 
}

provider "azurerm" {
  features {}
  use_oidc = true

  subscription_id   = var.ARM_SUBSCRIPTION_ID
  tenant_id         = var.ARM_TENANT_ID
  client_id         = var.ARM_CLIENT_ID
  client_secret     = var.ARM_CLIENT_SECRET
}
