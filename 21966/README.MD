Reproduction case for: https://github.com/hashicorp/terraform/issues/21966

Status: reproduced using local state backend
Terraform version: 0.13.3

Error seen:
```
Backend reinitialization required. Please run "terraform init".
Reason: Unsetting the previously set backend "local"

The "backend" is the interface that Terraform uses to store state,
perform operations, etc. If this message is showing up, it means that the
Terraform configuration you're using is using a custom configuration for
the Terraform backend.

Changes to backend configurations require reinitialization. This allows
Terraform to setup the new configuration, copy existing state, etc. This is
only done during "terraform init". Please run that command now then try again.

If the change reason above is incorrect, please verify your configuration
hasn't changed and try again. At this point, no changes to your existing
configuration or state have been made.


Error: Initialization required. Please see the error message above.
```


