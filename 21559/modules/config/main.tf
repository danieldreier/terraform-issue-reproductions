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
  #type = list // this is weird!!
  value = lookup(local.configs, module.live.name)
}

