Reproduction case for https://github.com/hashicorp/terraform/issues/25822

Status: unable to reproduce as stated

How to run:
```terraform init --backend-config="tier/locals/backend.tfvars```

Note that `tier/locals/backend.tfvars` intentionally does not exist.

Output:
```
❯ terraform init --backend-config="tier/locals/backend.tfvars"                                                     SIGINT(2) ↵  4479  14:25:03

Initializing the backend...

Initializing provider plugins...
- Finding hashicorp/random versions matching "~> 2.3.0"...
- Finding hashicorp/google versions matching "~> 3.33.0"...
- Finding hashicorp/kubernetes versions matching "~> 1.12.0"...
- Installing hashicorp/random v2.3.0...
- Installed hashicorp/random v2.3.0 (signed by HashiCorp)
- Installing hashicorp/google v3.33.0...
- Installed hashicorp/google v3.33.0 (signed by HashiCorp)
- Installing hashicorp/kubernetes v1.12.0...
- Installed hashicorp/kubernetes v1.12.0 (signed by HashiCorp)


Warning: Missing backend configuration

-backend-config was used without a "backend" block in the configuration.

If you intended to override the default local backend configuration,
no action is required, but you may add an explicit backend block to your
configuration to clear this warning:

terraform {
  backend "local" {}
}

However, if you intended to override a defined backend, please verify that
the backend configuration is present and valid.


Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```
