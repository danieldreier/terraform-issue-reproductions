variable "name" {}
variable "desired_capacity" {
  default = 2
}
variable "max_size" {
  default = 6
}
variable "ami_name_filter" {
  default = "amzn2-ami-ecs-hvm-2.0.*-x86_64-ebs"
}
variable "instance_type" {}
variable "instance_profile_name" {}
variable "key_name" {}
variable "security_groups" {
  type = list(string)
}
variable "volume_size" {
  default = 60
}
variable "subnets" {}
variable "tags" {
  default = {}
}
variable "user_data" {}
