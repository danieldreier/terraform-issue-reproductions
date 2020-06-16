module "lb-listener-ws-store" {
  source = "./modules/lb_listener_ssl"

  newvpc_lb_arn                     = module.alb-wsexternal.alb_arn
  newvpc_lb_listener_certificate_id = data.aws_acm_certificate.alb-ws-store-ext-cert.arn
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
