locals {
  configs = {
    prod = [
      "prodconfiga",
      "and",
      "prodconfigb",
    ]
    other = [
      "configa",
      "configb",
    ]
  }
}

module "live" {
  source = "../live"
}

output "config" {
  type = list
  value = lookup(local.configs, module.live.name)
}

