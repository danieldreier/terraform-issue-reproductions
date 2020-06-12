resource "null_resource" "example" {
  provisioner "local-exec" {
    command = "hello, world"
  }
}
