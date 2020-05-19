#!/usr/bin/env bash
set -x

rm -rf .terraform/ terraform.tfstate terraform.*.backup
terraform init
terraform apply -no-color -auto-approve
terraform state rm 'null_resource.example["foo"]'
terraform state rm 'module.mymodule.null_resource.example-in-module["fizz"]'
