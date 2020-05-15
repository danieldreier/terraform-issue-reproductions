variable "rsa_public_key_file" {
  type = string
}
variable "rsa_private_key_file" {
  type = string
}

provider "aws" {
  version = "~> 2.0"
  region  = "us-west-2"
}

resource "aws_vpc" "tf24955-repro" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "terraform-gh-24970"
  }
}

resource "aws_security_group" "allow_egress" {
  name        = "allow_egress"
  description = "Allow outbound traffic"
  vpc_id      = aws_vpc.tf24955-repro.id

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
  vpc_id      = aws_vpc.tf24955-repro.id

  ingress {
    description = "SSH into VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.tf24955-repro.cidr_block]
  }

  tags = {
    Name = "allow_rdp"
  }
}

resource "aws_security_group" "allow_ingress_rdp" {
  name        = "allow_rdp"
  description = "Allow RDP inbound traffic"
  vpc_id      = aws_vpc.tf24955-repro.id

  ingress {
    description = "RDP into VPC"
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.tf24955-repro.cidr_block]
  }

  tags = {
    Name = "allow_rdp"
  }
}

resource "aws_subnet" "example" {
  vpc_id            = aws_vpc.tf24955-repro.id
  availability_zone = "us-west-2a"
  cidr_block        = cidrsubnet(aws_vpc.tf24955-repro.cidr_block, 4, 1)
}

data "aws_ami" "os_windows" {

    filter {
       name ="name"
       values = ["Windows_Server-2019-English-Full-Base-2020.04.15"]
    }
    owners  = ["amazon"]
}

resource "aws_key_pair" "kms" {
  key_name   = "instance_kms_key-tf-24970"
  public_key = file("${path.module}/${var.rsa_public_key_file}")
}

resource "aws_eip" "instance_ip" {                  
  vpc      = true                                                      
  instance = aws_instance.windows2019.id
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.tf24955-repro.id

  tags = {
    Name = "main"
  }
}

resource "aws_instance" "windows2019" {
  ami           = data.aws_ami.os_windows.id
  instance_type = "t2.large"
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.allow_ingress_rdp.id, aws_security_group.allow_ingress_ssh.id]
  get_password_data = true
  key_name          = aws_key_pair.kms.key_name
  subnet_id         = aws_subnet.example.id

  tags = {
    Name = "windows2019"
  }
}

output "server-ip" {
  value = aws_eip.instance_ip.public_ip
}

output "password_data" {
  value=aws_instance.windows2019.password_data
}

output "password_decrypted" {
  value=rsadecrypt(aws_instance.windows2019.password_data, file("${path.module}/${var.rsa_private_key_file}") ) 
}