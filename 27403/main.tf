variable "foo" {
  default = 123
  sensitive = true
}

variable "bar" {
    default = 124
}

locals {
  secrets = {
    "x" = var.foo
    "y" = var.bar
    # ...
    # a bunch of values, some from resources, some form external variables
    # ...
  }
}

resource "random_pet" "param" {
  count = length(local.secrets)
}