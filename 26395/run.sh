#!/usr/bin/env bash
terraform init -reconfigure -backend-config=doesnotexist.hcl
