provider "aws" {
  region = "us-east-1"
}

variable "instance_count" { default = 3 }

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_launch_template" "foobar" {
  name_prefix   = "klaemm"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
}

resource "aws_autoscaling_group" "web" {
  min_size = 1
  max_size = 1
  launch_template {
    id      = aws_launch_template.foobar.id
    version = "$Latest"
  }
  availability_zones = ["us-west-2a"]

  dynamic "tag" {
    for_each = data.aws_instance.test.ebs_block_device

    content {
      propagate_at_launch = true
      key                 = "key"
      value               = tag.key
    }
  }
}

resource "aws_instance" "test" {
  // count         = var.instance_count
  ami           = data.aws_ami.ubuntu.id
  instance_type = "m1.small"

  tags = {
    Name = "klaemm-tf-test"
  }
}

data "aws_instance" "test" {
  instance_id = aws_instance.test.id
}
