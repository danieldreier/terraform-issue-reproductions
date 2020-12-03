variable "secret" {
  type      = string
  sensitive = true
}

module "module" {
  source = "./module"
  secret = var.secret
}
