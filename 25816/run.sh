#!/usr/bin/env bash

terraform init
terraform import "module.test_module.module.test_module2.null_resource.test_resource" test

