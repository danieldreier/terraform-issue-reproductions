#!/usr/bin/env bash
set -x

terraform-v0.12.24 init
terraform-v0.12.24 workspace select foo
