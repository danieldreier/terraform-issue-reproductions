variable "newvpc_env_name"                 {  default = "sandbox-t" }

variable "newvpc_aws_region"                           { default = "eu-west-1" }


variable "newvpc_vpc_str_prefix"                       {  default = "vpc"}
variable "newvpc_alb_str_prefix"                       {  default = "alb"}

variable "newvpc_routetable_str_prefix"                {  default = "rt"}
variable "newvpc_public_routetable_str_prefix"         {  default = "public"}
variable "newvpc_internetgateway_str_prefix"           {  default = "ig"}

variable "newvpc_ws_subnet_str_prefix"                 {  default = "dmz"}
variable "newvpc_lb_external_str_prefix"               {  default = "ext"}
variable "newvpc_lb_targetgroup_str_prefix"            {  default = "tg"}


variable "newvpc_env_internal_domainname"              { default = "connect.localvpc"   }
variable "newvpc_subnet_str_prefix"                    {  default = "sn"}

variable "newvpc_aws_availibility_zone1_long"           {  default = "eu-west-1a" }
variable "newvpc_aws_availibility_zone1_short"          {  default = "1a"         }
variable "newvpc_aws_availibility_zone2_long"           {  default = "eu-west-1b" }
variable "newvpc_aws_availibility_zone2_short"          {  default = "1b"    }


variable "newvpc_securitygroup_str_prefix"             {  default = "seg"}


variable "newvpc_cidr_blocks"             { default =  ["172.31.0.0/16", ""]  }

variable "newvpc_ws1_subnet_cidr_block"   { default = "172.31.19.0/27"  }
variable "newvpc_ws2_subnet_cidr_block"   { default = "172.31.19.32/27" }

variable "newvpc_alb_ws_store_external_listener_cfg"    {
                                                          default = [{
                                                                  protocol              = "HTTP",
                                                                  port                  = "443",
                                                                     },{
                                                                  protocol              = "HTTP",
                                                                  port                  = "19443",
                                                                    }]
                                                        }



variable "newvpc_alb_ws_store_external_targetgroup_cfg" {
                                                        default = [{
                                                                  protocol               = "HTTPS",
                                                                  target_port            = "9443",
                                                                  hc_port                = "9443",
                                                                  hc_protocol            = "HTTPS",
                                                                  hc_healthy_threshold   = "2",
                                                                  hc_unhealthy_threshold = "2",
                                                                  hc_timeout             = "2",
                                                                  hc_path                = "/store/",
                                                                  hc_interval            = "10",
                                                                  hc_matcher             = "200,302"
                                                                    },
                                                                    {
                                                                  protocol               = "HTTPS",
                                                                  target_port            = "9443",
                                                                  hc_port                = "9443",
                                                                  hc_protocol            = "HTTPS",
                                                                  hc_healthy_threshold   = "2",
                                                                  hc_unhealthy_threshold = "2",
                                                                  hc_timeout             = "2",
                                                                  hc_path                = "/store/",
                                                                  hc_interval            = "10",
                                                                  hc_matcher             = "200,302"
                                                                 }]
                                                        }
