#!/usr/bin/env bash
set -e # exit if anything fails
set -x # make sure commands are echo'd to stdout

terraform init
terraform plan
terraform apply
terraform plan
