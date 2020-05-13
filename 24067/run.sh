#!/usr/bin/env bash
echo 'This is a reproduction case for https://github.com/hashicorp/terraform/issues/24067'

rm -rf .terraform
terraform init
terraform validate
