variable "my_null_var" {
  type = string
}

resource "local_file" "my_file" {
  content  = var.my_null_var
  filename = "test.txt"
}
