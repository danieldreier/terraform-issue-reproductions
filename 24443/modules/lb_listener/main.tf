variable "newvpc_lb_arn"				{}
variable "newvpc_lb_listener_cfg"		{}
variable "newvpc_lb_tg_ids"				{}

resource "aws_lb_listener" "listener" {
  count		            = length(var.newvpc_lb_listener_cfg)

  load_balancer_arn 	= var.newvpc_lb_arn
  port              	= lookup(var.newvpc_lb_listener_cfg[count.index], "port")
  
  default_action {
    type             = "forward"
    target_group_arn = var.newvpc_lb_tg_ids[count.index]
  }
} 
