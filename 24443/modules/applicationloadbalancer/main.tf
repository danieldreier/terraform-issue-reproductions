variable "newvpc_alb_name"                  {}
variable "newvpc_alb_sg_ids"                {}
variable "newvpc_alb_sn_ids"                {}
variable "newvpc_alb_internal"              {}
variable "newvpc_alb_type"                  {}
variable "newvpc_route53_zone_id"           {}                  
variable "newvpc_route53_alb_cname_records" {}


resource "aws_alb" "alb" {
    name                        =   var.newvpc_alb_name
    internal                    =   var.newvpc_alb_internal
    security_groups             =   var.newvpc_alb_sg_ids
    subnets                     =   var.newvpc_alb_sn_ids
    load_balancer_type          =   var.newvpc_alb_type
    enable_deletion_protection  =   true
    
  tags = {
    Name = var.newvpc_alb_name
  } 
}

#Only trigger this resource there are entries in the newvpc_route53_alb_cname_records list
resource "aws_route53_record" "loadbalancer_route53_cname_record" {
   count                 = length(var.newvpc_route53_alb_cname_records)
   
   zone_id               = var.newvpc_route53_zone_id
   name                  = element(var.newvpc_route53_alb_cname_records, count.index)
   type                  = "CNAME"
   ttl                   = "300"
   records               = [aws_alb.alb.dns_name]
}
 
