resource "null_resource" "bar" {
  provisioner "local-exec" {
    command = "echo bar"
  }
}

terraform {
  required_version = ">= 0.13"

  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "~> 2.1"
    }
  }
}
