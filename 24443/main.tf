provider "aws" {
  region  = var.newvpc_aws_region
  profile = var.newvpc_env_name
}



module "vpc" {
  source = "./modules/vpc"

  newvpc_env_name                        = "${var.newvpc_vpc_str_prefix}-${var.newvpc_env_name}"
  newvpc_cidr_blocks                     = var.newvpc_cidr_blocks
  newvpc_env_internal_domainname         = var.newvpc_env_internal_domainname
}



module "internetgateway" {
  source = "./modules/internetgateway"

  newvpc_vpc_id                     = module.vpc.newvpc_vpc_id
  newvpc_internetgateway_name       = "${var.newvpc_internetgateway_str_prefix}-${var.newvpc_env_name}"
}


module "subnetsroutetables" {
  source = "./modules/subnetsroutetables"

  newvpc_vpc_id                      = module.vpc.newvpc_vpc_id

  newvpc_ws1_subnet_cidr_block       = var.newvpc_ws1_subnet_cidr_block
  newvpc_ws2_subnet_cidr_block       = var.newvpc_ws2_subnet_cidr_block

  newvpc_aws_availibility_zone1_long = var.newvpc_aws_availibility_zone1_long
  newvpc_aws_availibility_zone2_long = var.newvpc_aws_availibility_zone2_long

  newvpc_ws1_subnet_name             = "${var.newvpc_subnet_str_prefix}-${var.newvpc_env_name}-${var.newvpc_aws_availibility_zone1_short}-${var.newvpc_ws_subnet_str_prefix}"
  newvpc_ws2_subnet_name             = "${var.newvpc_subnet_str_prefix}-${var.newvpc_env_name}-${var.newvpc_aws_availibility_zone2_short}-${var.newvpc_ws_subnet_str_prefix}"

  newvpc_gateway_id                  = module.internetgateway.igw_id
  newvpc_public_routetable_name      = "${var.newvpc_routetable_str_prefix}-${var.newvpc_env_name}-${var.newvpc_public_routetable_str_prefix}"

}


module "securitygroups" {
  source = "./modules/securitygroups"

  newvpc_vpc_id                             = module.vpc.newvpc_vpc_id

  newvpc_alb_ws_external_securitygroup_name = "${var.newvpc_securitygroup_str_prefix}-${var.newvpc_env_name}-${var.newvpc_alb_str_prefix}-${var.newvpc_ws_subnet_str_prefix}-${var.newvpc_lb_external_str_prefix}"

}



# ALB external  DMZ store
module "alb-wsexternal" {
  source = "./modules/applicationloadbalancer"

  newvpc_alb_name                   = "${var.newvpc_alb_str_prefix}-${var.newvpc_env_name}-${var.newvpc_ws_subnet_str_prefix}-store-${var.newvpc_lb_external_str_prefix}"
  newvpc_alb_internal               = "false"
  newvpc_alb_sg_ids                 = [module.securitygroups.sg_alb_ws_external_id]
  newvpc_alb_sn_ids                 = [module.subnetsroutetables.sn_ws1_id, module.subnetsroutetables.sn_ws2_id]
  newvpc_alb_type                   = "application"
  newvpc_route53_zone_id            = ""
  newvpc_route53_alb_cname_records  = ""
}

module "lb-tg-ws-store" {
  source = "./modules/alb_targetgroup"

  newvpc_vpc_id                     = module.vpc.newvpc_vpc_id
  newvpc_lb_targetgroup_name        = "${var.newvpc_lb_targetgroup_str_prefix}-${var.newvpc_env_name}-${var.newvpc_ws_subnet_str_prefix}-store-${var.newvpc_lb_external_str_prefix}"
  newvpc_lb_targetgroup_cfg         = var.newvpc_alb_ws_store_external_targetgroup_cfg
}

module "lb-listener-ws-store" {
  source = "./modules/lb_listener"

  newvpc_lb_arn                     = module.alb-wsexternal.alb_arn
  newvpc_lb_listener_cfg            = var.newvpc_alb_ws_store_external_listener_cfg
  newvpc_lb_tg_ids                  = module.lb-tg-ws-store.tg_ids
}




resource "aws_alb_listener_rule" "alb_store_rule_blockcarbon" {

  listener_arn = module.lb-listener-ws-store[1].arn
  priority = "10"


  action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Access Denied"
      status_code  = "401"
    }
  }

  condition {
    path_pattern {
      values = ["/carbon*"]
    }
  }
}
