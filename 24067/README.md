Reproduction case for https://github.com/hashicorp/terraform/issues/24067

```
./run.sh

This is a reproduction case for https://github.com/hashicorp/terraform/issues/24067
Initializing modules...
- test in module/test

Initializing the backend...

Initializing provider plugins...
- Checking for available provider plugins...
- Downloading plugin for provider "vault" (hashicorp/vault) 2.10.0...

The following providers do not have any version constraints in configuration,
so the latest version was installed.

To prevent automatic upgrades to new major versions that may contain breaking
changes, it is recommended to add version = "..." constraints to the
corresponding provider blocks in configuration, with the constraint strings
suggested below.

* provider.vault: version = "~> 2.10"

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.


!!!!!!!!!!!!!!!!!!!!!!!!!!! TERRAFORM CRASH !!!!!!!!!!!!!!!!!!!!!!!!!!!!

Terraform crashed! This is always indicative of a bug within Terraform.
A crash log has been placed at "crash.log" relative to your current
working directory. It would be immensely helpful if you could please
report the crash with Terraform[1] so that we can fix this.

When reporting bugs, please include your terraform version. That
information is available on the first line of crash.log. You can also
get it by running 'terraform --version' on the command line.

SECURITY WARNING: the "crash.log" file that was created may contain 
sensitive information that must be redacted before it is safe to share 
on the issue tracker.

[1]: https://github.com/hashicorp/terraform/issues

!!!!!!!!!!!!!!!!!!!!!!!!!!! TERRAFORM CRASH !!!!!!!!!!!!!!!!!!!!!!!!!!!!
