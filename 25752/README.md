Reproduction case for https://github.com/hashicorp/terraform/issues/25752,
but for resources (https://github.com/terraform-providers/terraform-provider-aws/issues/14431).

Steps:

```
terraform init
terraform apply
# Apply should succeed
# Change the AWS provider version to "3.0.0"
terraform init
terraform apply
```