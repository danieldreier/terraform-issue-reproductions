#!/usr/bin/env bash
set -x

terraform init examples/standard
terraform validate examples/standard
