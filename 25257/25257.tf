resource "null_resource" "example" {
  provisioner "local-exec" {
    command = "echo \"/* hello world */\""
  }
}
