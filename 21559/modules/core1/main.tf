module "config" {
  source = "../config"
}

resource "random_pet" "core" {
  prefix = join("-", module.config.config)
}

output "core" {
  value = random_pet.core.id
}
