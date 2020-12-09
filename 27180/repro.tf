variable "prefix" {
  type    = string
  default = ""
}

variable "tags" {
  type    = map(any)
  default = {}
}

variable "secrets" {
  type = map(string)
  sensitive = true
  default = {
    "secret1" = "hunter2"
    "secret2" = "my hunter2-ing hunter2"
  }
}

resource "null_resource" "secret" {
  for_each = toset(keys(var.secrets))
}