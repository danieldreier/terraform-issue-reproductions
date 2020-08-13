#!/usr/bin/env bash

rm -rf .terraform terraform.tfstate* module1/.terraform module1/terraform.tfstate main.tf
cd module1
terraform init
terraform apply -auto-approve
cd ..
cp main.tf-original main.tf
terraform init
terraform apply -auto-approve
cp main.tf-reduced main.tf
terraform apply -auto-approve
