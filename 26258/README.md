Repro for https://github.com/hashicorp/terraform/issues/26258

Steps:

- `terraform init`
- `terraform import -allow-missing-config random_string.test test`
