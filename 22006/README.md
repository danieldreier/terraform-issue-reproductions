Reproduction case for https://github.com/hashicorp/terraform/issues/22006

Status: unable to reproduce, presumed fixed. The file provisioner runs at a normal speed.

How to run:
```
ssh-keygen -f rsa_key -N ""
terraform init
terraform apply
```
