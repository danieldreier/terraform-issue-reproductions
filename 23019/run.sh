#!/usr/bin/env bash
set -e # exit if anything fails
set -x # make sure commands are echo'd to stdout

rm -rf .terraform terraform.tfstate crash.log
terraform init
terraform plan -var 'the_list=["a","b","c"]'