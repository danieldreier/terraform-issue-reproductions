#!/usr/bin/env bash

mkdir -p plugin_cache

TF_CLI_CONFIG_FILE=$PWD/.terraformrc terraform init

echo "The following .terraform.lock.hcl contains both h1 and zh hashes"
cat .terraform.lock.hcl

mv .terraform.lock.hcl .terraform.lock.hcl.working
TF_CLI_CONFIG_FILE=$PWD/.terraformrc terraform init

echo "The following .terraform.lock.hcl contains only h1 hashes"
cat .terraform.lock.hcl
