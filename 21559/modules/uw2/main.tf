module "core1" {
  source = "../core1"
}

// normally there are other things here...
// adding core2 just as filler
module "core2" {
  source = "../core2"
}

output "core" {
  value = "core: ${module.core1.core}"
}

