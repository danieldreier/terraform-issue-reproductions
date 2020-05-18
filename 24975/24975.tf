provider "aws" {
  version = "~> 2.0"
  region  = "us-west-2"
}

resource "aws_vpc" "vpc-testcase" {
  cidr_block = "172.16.0.0/16"
}

resource "aws_security_group" "allow_egress" {
  name        = "allow_egress"
  description = "Allow outbound traffic"
  vpc_id      = aws_vpc.vpc-testcase.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_egress"
  }
}

resource "aws_security_group" "allow_ingress_ssh" {
  name        = "allow_ingress_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.vpc-testcase.id

  ingress {
    description = "SSH into VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.vpc-testcase.cidr_block]
  }

  tags = {
    Name = "allow_rdp"
  }
}

resource "aws_security_group" "allow_ingress_rdp" {
  name        = "allow_rdp"
  description = "Allow RDP inbound traffic"
  vpc_id      = aws_vpc.vpc-testcase.id

  ingress {
    description = "RDP into VPC"
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.vpc-testcase.cidr_block]
  }

  tags = {
    Name = "allow_rdp"
  }
}

resource "aws_subnet" "example" {
  vpc_id            = aws_vpc.vpc-testcase.id
  availability_zone = "us-west-2a"
  cidr_block        = cidrsubnet(aws_vpc.vpc-testcase.cidr_block, 4, 1)
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc-testcase.id

  tags = {
    Name = "main"
  }
}

# Create the Route Table
resource "aws_route_table" "My_VPC_route_table" {
  vpc_id = aws_vpc.vpc-testcase.id
  tags = {
    Name = "My VPC Route Table"
  }
}