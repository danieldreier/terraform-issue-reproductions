Reproduction case for https://github.com/hashicorp/terraform/issues/25888

Status: reproduced

## Steps to reproduce

- `terraform init`
- `terraform plan -var-file=./tfvars/lab.tfvars` succeeds with a valid plan
- `terraform apply -var-file=./tfvars/lab.tfvars` applies correctly
- `terraform import -var-file=tfvars/lab.tfvars module.vpc.random_string.this test` fails with an invalid variable error instead of importing
