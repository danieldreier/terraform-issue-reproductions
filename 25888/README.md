Reproduction case for https://github.com/hashicorp/terraform/issues/25888

Status: reproduced

## Steps to reproduce

- `terraform init`
- `terraform plan -var-file=./tfvars/lab.tfvars` succeeds with a valid plan
- `terraform apply -var-file=./tfvars/lab.tfvars` applies correctly
- `terraform destroy -var-file=./tfvars/lab.tfvars` removes the resource
- `terraform import -var-file=./tfvars/lab.tfvars module.vpc.random_string.this test` fails with an invalid variable error instead of importing

## Error

```shellsession
$ terraform import -var-file=tfvars/lab.tfvars module.vpc.random_string.this test
module.vpc.random_string.this: Importing from ID "test"...
module.vpc.random_string.this: Import prepared!
  Prepared random_string for import
module.vpc.random_string.this: Refreshing state... [id=test]

Error: Unsupported attribute

  on modules/vpc/main.tf line 3, in locals:
   3:     is_local = (var.rt53.local.private_zone_name == null) ? 0 : 1
    |----------------
    | var.rt53 is object with no attributes

This object does not have an attribute named "local".
```
