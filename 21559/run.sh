#!/usr/bin/env bash

set -x
rm -rf .terraform terraform.tfstate terraform.tfstate.backup foo.plan
terraform-v0.12.0 init -no-color
terraform-v0.12.0 plan -no-color -out foo.plan
terraform-v0.12.0 apply -no-color foo.plan
