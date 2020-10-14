Reproduction case for: https://github.com/hashicorp/terraform/issues/24443

Status: complete reproduction case

```
terraform init
terraform plan
terraform apply

will bail out with 

Error: configuration for aws_alb_listener_rule.alb_store_rule_blockcarbon still contains unknown values during apply (this is a bug in Terraform; please report it!)


```


