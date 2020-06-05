module "vpc" {
  source  = "../vpc"

  name = var.name

  azs             = var.vpc_azs
  cidr            = var.vpc_cidr
  public_subnets  = var.vpc_public_subnets
  private_subnets = var.vpc_private_subnets
}

module "ec2" {
  source                = "../ec2_autoscale"
  name                  = var.name
  instance_type         = "t3.nano"
  instance_profile_name = "test"
  ami_name_filter       = "amzn2-ami-hvm-2.0.*-x86_64-ebs"
  key_name         = "test"
  desired_capacity = 1
  max_size         = 2
  volume_size      = 8
  security_groups  = []
  subnets          = module.vpc.public_subnets
  user_data        = ""
}
