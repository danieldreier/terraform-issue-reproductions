#!/usr/bin/env bash

cp repro.tf-orig repro.tf
terraform init
terraform apply -auto-approve

cp repro.tf-removed repro.tf
terraform apply -auto-approve
