
output "newvpc_vpc_id" {
  value       = aws_vpc.terraform-vpc.id
  description = "The id of the newly created VPC"
}