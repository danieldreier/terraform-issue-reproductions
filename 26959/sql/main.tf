terraform {
  experiments = [provider_sensitive_attrs]
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.34.0"
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

data "terraform_remote_state" "vault" {
  backend = "local"
  config = {
    path = "${path.module}/../vault/terraform.tfstate"
  }
}

locals {
  vault_name = data.terraform_remote_state.vault.outputs.vault
  rg_name = data.terraform_remote_state.vault.outputs.rg
}

data "azurerm_client_config" "current" {}

data "azurerm_key_vault" "kv" {
  name                = local.vault_name
  resource_group_name = local.rg_name
}

data "azurerm_key_vault_secret" "sql_password" {
  name         = "sqlpassword"
  key_vault_id = data.azurerm_key_vault.kv.id
}

resource "azurerm_sql_server" "example" {
  name                         = "mssqlserver-26959"
  resource_group_name          = local.rg_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = data.azurerm_key_vault_secret.sql_password.value
}
