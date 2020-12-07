provider "aws" {
  region = "eu-west-1"
}

data "aws_vpc" "default" {
  default = true
}

resource "aws_security_group" "terraform-0-14-test" {
  name = "terraform-0-14-test"
  description = "test terraform 0.14 ignore_changes"

  tags = {
    Name = "terraform-0.14-test"
    Created = timestamp()
  }

  lifecycle {
    ignore_changes = [tags]
  }
}
