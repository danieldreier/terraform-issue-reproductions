#!/usr/bin/env bash
set -e

terraform init ./subfolder
terraform validate ./subfolder
terraform plan -out=test.plan ./subfolder
terraform show "test.plan"
