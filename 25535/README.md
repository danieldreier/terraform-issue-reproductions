Reproduction case for https://github.com/hashicorp/terraform/issues/25535

Status: unable to reproduce
Version: 0.13.3

Result:

Unable to reproduce. I get the expected output ending in:
```
Apply complete! Resources: 8 added, 0 changed, 0 destroyed.
Resource instance module.modwithsubmodule[0].module.submodule[0].null_resource.thing-in-nested-submodule has been marked as tainted.
```
