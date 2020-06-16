Reproduction case for: https://github.com/hashicorp/terraform/issues/24443

Status: incomplete reproduction case

```
❯ terraform plan
provider.aws.region
  The region where AWS operations will take place. Examples
  are us-east-1, us-west-2, etc.

  Enter a value: us-west-2


Error: Reference to undeclared module

  on main.tf line 4, in module "lb-listener-ws-store":
   4:   newvpc_lb_arn                     = module.alb-wsexternal.alb_arn

No module call named "alb-wsexternal" is declared in the root module.


Error: Reference to undeclared resource

  on main.tf line 5, in module "lb-listener-ws-store":
   5:   newvpc_lb_listener_certificate_id = data.aws_acm_certificate.alb-ws-store-ext-cert.arn

A data resource "aws_acm_certificate" "alb-ws-store-ext-cert" has not been
declared in the root module.


Error: Reference to undeclared input variable

  on main.tf line 6, in module "lb-listener-ws-store":
   6:   newvpc_lb_listener_cfg            = var.newvpc_alb_ws_store_external_listener_cfg

An input variable with the name "newvpc_alb_ws_store_external_listener_cfg"
has not been declared. This variable can be declared with a variable
"newvpc_alb_ws_store_external_listener_cfg" {} block.


Error: Reference to undeclared module

  on main.tf line 7, in module "lb-listener-ws-store":
   7:   newvpc_lb_tg_ids                  = module.lb-tg-ws-store.tg_ids

No module call named "lb-tg-ws-store" is declared in the root module.
```
