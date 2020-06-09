Reproduction case for https://github.com/hashicorp/terraform/issues/24975

If you look at and run `run.sh`, you'll see that this creates a set of AWS resources, destroys them, and then when you recover the backup state file and re-run destroy, it reports that it is destroying one resource that was presumably destroyed in the first destroy.

The puzzling thing here is shown below:

```
aws_vpc.vpc-testcase: Refreshing state... [id=vpc-09eba902fa5910e52]
aws_route_table.My_VPC_route_table: Refreshing state... [id=rtb-0e8a5a0322a94d98a]
aws_internet_gateway.gw: Refreshing state... [id=igw-0bba5997d20abb1da]
aws_security_group.allow_ingress_rdp: Refreshing state... [id=sg-010b96151f4708f99]
aws_subnet.example: Refreshing state... [id=subnet-0e8ab00aeb7fc04ff]
aws_security_group.allow_ingress_ssh: Refreshing state... [id=sg-013fd65e6d711bf29]
aws_security_group.allow_egress: Refreshing state... [id=sg-04d281b9e8cbb5e9f]
aws_route_table_association.My_VPC_association: Refreshing state... [id=rtbassoc-04ffe3b8c2b7e1ce7]
aws_route_table_association.My_VPC_association: Destroying... [id=rtbassoc-04ffe3b8c2b7e1ce7]
aws_route_table_association.My_VPC_association: Destruction complete after 1s

Destroy complete! Resources: 1 destroyed.
aws_vpc.vpc-testcase: Refreshing state... [id=vpc-09eba902fa5910e52]
aws_route_table.My_VPC_route_table: Refreshing state... [id=rtb-0e8a5a0322a94d98a]
aws_internet_gateway.gw: Refreshing state... [id=igw-0bba5997d20abb1da]
aws_security_group.allow_ingress_rdp: Refreshing state... [id=sg-010b96151f4708f99]
aws_subnet.example: Refreshing state... [id=subnet-0e8ab00aeb7fc04ff]
aws_security_group.allow_egress: Refreshing state... [id=sg-04d281b9e8cbb5e9f]
aws_security_group.allow_ingress_ssh: Refreshing state... [id=sg-013fd65e6d711bf29]
aws_route_table_association.My_VPC_association: Refreshing state... [id=rtbassoc-04ffe3b8c2b7e1ce7]
aws_route_table_association.My_VPC_association: Destroying... [id=rtbassoc-04ffe3b8c2b7e1ce7]
aws_route_table_association.My_VPC_association: Destruction complete after 0s

Destroy complete! Resources: 1 destroyed.
aws_vpc.vpc-testcase: Refreshing state... [id=vpc-09eba902fa5910e52]
aws_internet_gateway.gw: Refreshing state... [id=igw-0bba5997d20abb1da]
aws_route_table.My_VPC_route_table: Refreshing state... [id=rtb-0e8a5a0322a94d98a]
aws_subnet.example: Refreshing state... [id=subnet-0e8ab00aeb7fc04ff]
aws_security_group.allow_ingress_rdp: Refreshing state... [id=sg-010b96151f4708f99]
aws_security_group.allow_egress: Refreshing state... [id=sg-04d281b9e8cbb5e9f]
aws_security_group.allow_ingress_ssh: Refreshing state... [id=sg-013fd65e6d711bf29]
aws_route_table_association.My_VPC_association: Refreshing state... [id=rtbassoc-04ffe3b8c2b7e1ce7]
aws_route_table_association.My_VPC_association: Destroying... [id=rtbassoc-04ffe3b8c2b7e1ce7]
aws_route_table_association.My_VPC_association: Destruction complete after 0s

Destroy complete! Resources: 1 destroyed.
```
