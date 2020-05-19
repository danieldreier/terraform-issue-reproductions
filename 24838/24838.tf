provider "aws" {
  version = "~> 2.0"
  region  = "us-west-2"
}

variable "sg_ports" {
  type          = list(number)
  description = "List of ingress ports"
  default     = [8200, 8201, 8300, 9200, 9500]
}

resource "aws_security_groups" "dynamicsg" {
  name        = "dynamicsg"
  description = "Ingress for Vault"
  
    dynamic "ingress" {
    for_each = var.sg_ports
    content {
        from_port   = ingress.value
        to_port     = ingress.value
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
}
