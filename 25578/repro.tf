resource "null_resource" "this" {
  count = 1
}

output "null_resource_id" {
  description = "ID of the null resource"
  value = null_resource.this[0].id
}
