resource "null_resource" "resource1" {
}

output "null_id" {
  value = null_resource.resource1.id
}
