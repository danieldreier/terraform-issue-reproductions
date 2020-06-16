provider "azurerm" {
  features {}
}

locals {
  keys = {
    for item in keys(var.regions):
      "${item}" => item
  }
  
  prefixs = {
    for location in keys(var.regions):
      "${location}" => var.prefixs[location].prefix
  }
  
  integration_topics = [    
    "sws-product-v2-v3"
  ]
  topic_region = flatten([
    for key in keys(var.regions) : [
      for topic in local.integration_topics : {
        "key" = key
        "topic" = topic
      }
    ]
  ])
  topic_region_map = {
    for item in local.topic_region:
      "${item.key}:${item.topic}" => {
        "key" = item.key
        "topic" = item.topic
      }
  }
}

resource "azurerm_resource_group" "main" {
  name     = "rontest-bold-resources"
  location = "northcentralus"
}

resource "azurerm_app_service_plan" "main" {
  for_each = local.keys
  name                = "${local.prefixs[each.value]}-asp"
  location            = each.value
  resource_group_name = azurerm_resource_group.main.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "main" {
  for_each = local.keys
  name                = "${local.prefixs[each.key]}-${each.key}-appservice"
  #count = 0
  location            = var.regions[each.key].location
  resource_group_name = "rontest-bold-resources"
  app_service_plan_id = azurerm_app_service_plan.main[each.key].id

  site_config {
    dotnet_framework_version = "v4.0"
  }
}
