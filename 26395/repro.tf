terraform {
  backend "s3" {
    bucket = "mybucket"
    key    = "path/to/my/key"
    region = "us-east-1"
  }
}

resource "null_resource" "cluster" {
  provisioner "local-exec" {
    command = "echo hello world"
  }
}
