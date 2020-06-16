locals {
  set_of_resources = [
    "one",
    "two",
    "three",
  ]
}

resource "null_resource" "example" {
  for_each = toset(local.set_of_resources)
}
