Reproduction case for https://github.com/hashicorp/terraform/issues/26395

Status: unable to reproduce
Version tested: 0.13.3

how to run: `./run.sh`

Output I got:
```
terraform init -reconfigure -backend-config=doesnotexist.hcl

Initializing the backend...

Error: Failed to read file

The file "doesnotexist.hcl" could not be read.
```

