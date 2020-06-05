#!/usr/bin/env bash
set -e # exit if anything fails
set -x # make sure commands are echo'd to stdout

command -v terraform-v0.13.0-beta1 || echo "you must have terraform-v0.13.0-beta1 in your path for this example to work"

terraform-v0.13.0-beta1 validate
