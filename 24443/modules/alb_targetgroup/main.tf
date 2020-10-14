variable "newvpc_vpc_id"                        {}
variable "newvpc_lb_targetgroup_name"           {}
variable "newvpc_lb_targetgroup_cfg"            {}

resource "aws_lb_target_group" "tg" {
  count                = length(var.newvpc_lb_targetgroup_cfg)

  name                 = "${var.newvpc_lb_targetgroup_name}-${lookup(var.newvpc_lb_targetgroup_cfg[count.index], "target_port")}"
  port                 = lookup(var.newvpc_lb_targetgroup_cfg[count.index], "target_port")
  protocol             = lookup(var.newvpc_lb_targetgroup_cfg[count.index], "protocol")
  target_type          = "ip"
  vpc_id               = var.newvpc_vpc_id

  stickiness {
    type             = "lb_cookie"
    cookie_duration  = 60
    enabled          = true

  }

  health_check {
    port                = lookup(var.newvpc_lb_targetgroup_cfg[count.index], "hc_port")
    protocol            = lookup(var.newvpc_lb_targetgroup_cfg[count.index], "hc_protocol")
    path                = lookup(var.newvpc_lb_targetgroup_cfg[count.index], "hc_path")
    interval            = lookup(var.newvpc_lb_targetgroup_cfg[count.index], "hc_interval")
    unhealthy_threshold = lookup(var.newvpc_lb_targetgroup_cfg[count.index], "hc_unhealthy_threshold")
    healthy_threshold   = lookup(var.newvpc_lb_targetgroup_cfg[count.index], "hc_healthy_threshold")
    matcher             = lookup(var.newvpc_lb_targetgroup_cfg[count.index], "hc_matcher")
  }
}
