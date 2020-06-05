data "aws_ami" "this" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = [var.ami_name_filter]
  }

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }
}

#######################
# Launch configuration
#######################
resource "aws_launch_template" "this" {
  name          = var.name
  image_id      = data.aws_ami.this.image_id
  instance_type = var.instance_type
  key_name      = var.key_name
  user_data     = base64encode(var.user_data)
  ebs_optimized = false
  tags          = var.tags
  tag_specifications {
    resource_type = "instance"
    tags          = var.tags
  }
  tag_specifications {
    resource_type = "volume"
    tags          = var.tags
  }
  iam_instance_profile {
    name = var.instance_profile_name
  }
  network_interfaces {
    associate_public_ip_address = true
    security_groups             = var.security_groups
  }
  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      delete_on_termination = true
      volume_type           = "gp2"
      volume_size           = var.volume_size
    }

  }
}

####################
# Autoscaling group
####################
resource "aws_autoscaling_group" "this" {
  name_prefix           = "${var.name}-"
  max_size              = var.max_size
  min_size              = 1
  desired_capacity      = var.desired_capacity
  vpc_zone_identifier   = var.subnets
  termination_policies  = ["OldestInstance"]
  max_instance_lifetime = 604800 # 1 week
  protect_from_scale_in = true
  launch_template {
    id      = aws_launch_template.this.id
    version = "$Latest"
  }


  lifecycle {
    create_before_destroy = true
    ignore_changes        = [desired_capacity]
  }

  dynamic "tag" {
    for_each = var.tags
    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }
  tag {
    key                 = "Name"
    value               = var.name
    propagate_at_launch = true
  }
}
