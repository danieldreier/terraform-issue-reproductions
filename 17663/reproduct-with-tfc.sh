#!/usr/bin/env bash

TERRAFORM="terraform-v0.12.26"
set -x

rm -rf terraform.tfstate* .terraform/ add_tfc_backend.tf
$TERRAFORM init
$TERRAFORM apply -auto-approve
rm -f example.tf
cp add_tfc_backend.tf.disabled add_tfc_backend.tf
$TERRAFORM init -force-copy
