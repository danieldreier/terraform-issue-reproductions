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

variable "instance_ami" {
  description = "AWS EC2 instance AMI"
  default     = "ami-04bb0cc469b2b81cc"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

resource "aws_instance" "web" {
  ami                         = var.instance_ami
  instance_type               = var.instance_type
}

output "network_interface_id" {
  description = "ID of the network interface that was created with the instance."
  value       = aws_instance.web.network_interface_id
}