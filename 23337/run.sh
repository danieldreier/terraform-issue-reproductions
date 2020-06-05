#!/usr/bin/env bash
set -e # exit if anything fails
set -x # make sure commands are echo'd to stdout

cd pwd
rm -rf .terraform *.tf
terraform init -from-module ../root_module