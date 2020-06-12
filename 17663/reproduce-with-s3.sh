#!/usr/bin/env bash

TERRAFORM="terraform-v0.12.26"
set -x

aws s3 rm s3://danieldreier-tf-state/repro/tf-17663/state
rm -rf terraform.tfstate* .terraform/ add_backend.tf
$TERRAFORM init
$TERRAFORM apply -auto-approve
rm -f example.tf
cp add_s3_backend.tf.disabled add_backend.tf
$TERRAFORM init -force-copy
