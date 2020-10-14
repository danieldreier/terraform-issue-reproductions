variable newvpc_vpc_id                                  {}
variable newvpc_alb_ws_external_securitygroup_name      {}


 

### security groups Application Load Balancers

resource "aws_security_group" "sg_alb_ws_external" {
  name        = var.newvpc_alb_ws_external_securitygroup_name
  description = "Security group ${var.newvpc_alb_ws_external_securitygroup_name}"
  vpc_id      = var.newvpc_vpc_id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "443 offices"
  }

   egress {
     from_port       = 0
     to_port         = 0
     protocol        = "-1" 
     cidr_blocks     = ["0.0.0.0/0"]
     description     = "allow all outbound traffic"
   } 

  tags = {
    Name = var.newvpc_alb_ws_external_securitygroup_name   

  }     
   
} 


