Reproduction case for https://github.com/hashicorp/terraform/issues/24594

Status: unable to reproduce with 0.12.26 or 0.13.0 beta 1

Results in the following plan (as expected)
```
Terraform will perform the following actions:

  # null_resource.example["one"] will be created
  + resource "null_resource" "example" {
      + id = (known after apply)
    }

  # null_resource.example["three"] will be created
  + resource "null_resource" "example" {
      + id = (known after apply)
    }

  # null_resource.example["two"] will be created
  + resource "null_resource" "example" {
      + id = (known after apply)
    }

Plan: 3 to add, 0 to change, 0 to destroy.

```
