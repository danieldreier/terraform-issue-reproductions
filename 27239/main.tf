module "input" {
  source   = "./modules/input"
}

locals {
  config = {
    test = {
      token = module.input.token
    }
  }
}

module "test" {
  source   = "./modules/test"
  projects = ["project1"]
  config   = local.config
}