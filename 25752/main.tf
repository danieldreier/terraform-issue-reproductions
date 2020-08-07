terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "2.70.0"
    }
  }

  required_version = "0.13.0"
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "web" {
  ami                         = "ami-04bb0cc469b2b81cc"
  instance_type               = "t2.micro"
}

output "network_interface_id" {
  description = "ID of the network interface that was created with the instance."
  value       = aws_instance.web.network_interface_id
}