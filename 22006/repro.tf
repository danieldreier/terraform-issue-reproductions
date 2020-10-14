provider "aws" {
  region = "us-east-1"
}

variable "rsa_public_key_file" {
  type = string
  default = "rsa_key.pub"
}

resource "aws_key_pair" "key" {
  key_name   = "terraform-test"
  public_key = file(var.rsa_public_key_file)
}

# Lookup the correct AMI based on the region specified
data "aws_ami" "amazon_windows_2016" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["Windows_Server-2016-English-Full-Base-*"]
  }
}

resource "aws_security_group" "windows" {
  name        = "allow_tls"
  description = "windows test"

  # WinRM access from anywhere
  ingress {
    from_port   = 5985
    to_port     = 5986
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Generate a password for our WinRM connection
resource "random_string" "winrm_password" {
  length  = 16
  special = false
}

# User-data
data "template_file" "user_data" {
  template = file("user_data.tpl")

  vars = {
    password = random_string.winrm_password.result
  }
}

# Public IP
resource "aws_eip" "lb" {
  instance = aws_instance.windows.id
}

resource "aws_instance" "windows" {
  ami                = data.aws_ami.amazon_windows_2016.id
  user_data          = data.template_file.user_data.rendered
  instance_type      = "m1.small"
  security_groups    = [aws_security_group.windows.name]
  key_name           = "terraform-test"
  get_password_data  = true

    provisioner "file" {
      content     = "hiya"
      destination = "C:/Terraform/TestFolder1"
      connection {
        host     = self.public_ip
        type     = "winrm"
        user     = "terraform"
        password = random_string.winrm_password.result
        timeout  = "15m"
        https    = true
        port     = "5986"
        insecure = true
      }
    }

    provisioner "file" {
      content     = "i know new york i need new york i know i need unique new york"
      destination = "C:/Terraform/TestFolder1"
      connection {
        host     = self.public_ip
        type     = "winrm"
        user     = "terraform"
        password = random_string.winrm_password.result
        timeout  = "15m"
        https    = true
        port     = "5986"
        insecure = true
      }
    }
}
