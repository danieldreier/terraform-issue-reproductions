#!/usr/bin/env bash
set -e # exit if anything fails

command -v terraform-v0.12.26 || echo "you must have terraform-v0.12.26 in your path for this example to work"
command -v terraform-v0.13.0-beta1 || echo "you must have terraform-v0.13.0-beta1 in your path for this example to work"

rm -rf .terraform
terraform-v0.12.26 init
terraform-v0.13.0-beta1 init