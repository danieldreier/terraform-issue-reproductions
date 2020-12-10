locals {
  token = "foo"
}

output "token" {
  value     = local.token
  sensitive = true
}
