#!/usr/bin/env bash

# clean up
rm -rf .terraform terraform.tfstate* repro.tf versions.tf

cp repro.tf-step1 repro.tf
terraform-v0.13.3 init
terraform-v0.13.3 apply -auto-approve
cp repro.tf-step2 repro.tf
#terraform-v0.13.3 0.13upgrade -yes
#terraform-v0.13.3 state replace-provider -auto-approve registry.terraform.io/-/aws registry.terraform.io/hashicorp/aws
terraform-v0.13.3 apply -auto-approve
