#!/usr/bin/env bash

rm -rf .terraform terraform.tfstate terraform.tfstate.backup
terraform init
terraform apply -auto-approve
terraform destroy -auto-approve
terraform destroy -auto-approve
