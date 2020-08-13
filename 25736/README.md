Reproduction case for https://github.com/hashicorp/terraform/issues/25736

Status: unable to reproduce on 0.12.29 or 0.13.0

```
 ./run.sh                                                                                                                     ✔  4591  12:34:43

Initializing the backend...

Initializing provider plugins...
- Using previously-installed hashicorp/random v2.3.0

The following providers do not have any version constraints in configuration,
so the latest version was installed.

To prevent automatic upgrades to new major versions that may contain breaking
changes, we recommend adding version constraints in a required_providers block
in your configuration, with the constraint strings suggested below.

* hashicorp/random: version = "~> 2.3.0"

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
random_id.name_suffix: Refreshing state... [id=sswtGw]

Apply complete! Resources: 0 added, 0 changed, 0 destroyed.
random_id.name_suffix: Refreshing state... [id=sswtGw]
random_id.name_suffix: Destroying... [id=sswtGw]
random_id.name_suffix: Destruction complete after 0s

Apply complete! Resources: 0 added, 0 changed, 1 destroyed.
terraform-issue-reproductions/25736 on  master [✘!?] took 2s
```
