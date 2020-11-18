terraform {
  experiments = [provider_sensitive_attrs]
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.34.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}

variable "location" {
  type    = string
  default = "eastus"
}

data "azurerm_client_config" "current" {}

resource "random_string" "storage_name" {
  length  = 24
  upper   = false
  lower   = true
  number  = true
  special = false
}

resource "azurerm_resource_group" "rg" {
  name     = "rg"
  location = var.location
}

resource "azurerm_storage_account" "sa" {
  name                     = random_string.storage_name.result
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_key_vault" "kv" {
  name                = "vault-26959"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku_name            = "standard"
  tenant_id           = data.azurerm_client_config.current.tenant_id

  access_policy {
    tenant_id          = data.azurerm_client_config.current.tenant_id
    object_id          = data.azurerm_client_config.current.object_id
    secret_permissions = ["delete", "get", "set"]
  }
}

resource "azurerm_key_vault_secret" "sql_password" {
  name         = "sqlpassword"
  value        = "PassWord$123"
  key_vault_id = azurerm_key_vault.kv.id
}

output "rg" {
  value = azurerm_resource_group.rg.name
}

output "vault" {
  value = azurerm_key_vault.kv.name
}
