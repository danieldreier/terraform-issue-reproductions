resource "null_resource" "foo-in-module" {
  provisioner "local-exec" {
    command = "echo hello world"
  }
}
