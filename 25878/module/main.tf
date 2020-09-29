variable "should_create" {
  type    = bool
}

resource "null_resource" "normal" {
  provisioner "local-exec" {
    command = "echo normal"
  }
}

resource "null_resource" "count" {
  count = var.should_create ? 1 : 0

  provisioner "local-exec" {
    command = "echo count"
  }
}

resource "null_resource" "for_each" {
  for_each = var.should_create ? toset(["foo"]) : toset([])

  provisioner "local-exec" {
    command = "echo for_each"
  }
}

locals {
  id = null_resource.normal.id
  count_id = null_resource.count[0].id
  for_each_id = null_resource.for_each["foo"].id
}

output "normal" {
  value = local.id
}

output "count" {
  value = local.count_id
}

output "for_each" {
  value = local.for_each_id
}