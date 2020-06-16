Reproduction case for:

Status: unable to reproduce on 0.12.24, 0.12.26, or 0.13.0 beta 1

```
bash-3.2$ ./run.sh
+ terraform-v0.12.24 init

Initializing the backend...

Initializing provider plugins...

The following providers do not have any version constraints in configuration,
so the latest version was installed.

To prevent automatic upgrades to new major versions that may contain breaking
changes, it is recommended to add version = "..." constraints to the
corresponding provider blocks in configuration, with the constraint strings
suggested below.

* provider.null: version = "~> 2.1"

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
+ terraform-v0.12.24 workspace select foo

Workspace "foo" doesn't exist.

You can create this workspace with the "new" subcommand.
```
