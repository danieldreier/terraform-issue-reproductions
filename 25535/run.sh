#!/usr/bin/env bash

rm -rf .terraform terraform.tfstate terraform.tfstate.backup
terraform init
terraform apply -auto-approve
terraform taint "module.modwithsubmodule[0].module.submodule[0].null_resource.thing-in-nested-submodule"

