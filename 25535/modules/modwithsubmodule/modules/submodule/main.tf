resource "null_resource" "thing-in-nested-submodule" {
  provisioner "local-exec" {
    command = "echo hello world"
  }
}
