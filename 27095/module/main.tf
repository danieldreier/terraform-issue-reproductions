variable "secret" {
  type      = string
  sensitive = true
}

resource "local_file" "secret" {
  content         = var.secret
  filename        = "${path.module}/secret.txt"
  file_permission = "0600"
}
