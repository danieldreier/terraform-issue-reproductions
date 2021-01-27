locals {
  items = {
    foo = {
      some_key = "some_value",
      id = null_resource.main.id,
    }
  }
}

resource "null_resource" "main" {
}

resource "null_resource" "bar" {
  for_each = lookup(local.items, "bar", {})
}
