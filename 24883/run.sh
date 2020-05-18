#!/usr/bin/env bash

rm -rf .terraform terraform.tfstate a.txt b.txt
terraform init
terraform apply -auto-approve
rm a.txt
terraform apply -auto-approve
