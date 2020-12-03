Issue reproduction for https://github.com/hashicorp/terraform/issues/27095

Status: reproduced
How to reproduce: (exactly as stated in original GH issue)
```
export TF_VAR_secret=secret
terraform init
terraform apply
```
