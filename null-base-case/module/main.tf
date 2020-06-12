variable "name" {
  type = string
}

resource "null_resource" "resource_in_module" {
  triggers = {
    name = var.name
  }
}

output "id" {
  value = null_resource.resource_in_module.id
}

resource "null_resource" "resource_in_module_in_for_each" {
  for_each = {"foo" = "bar","fizz" = "buzz"}
}


