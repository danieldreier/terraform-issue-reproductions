Reproduction case for https://github.com/hashicorp/terraform/issues/24835

Status: unable to reproduce

How to use this:

1. If on a mac, install squid with: `brew install squid`
2. Start squid foregrounded with: `./os_x_run_squid.sh`
3. Confirm that your proxy works with: `curl --verbose -x http://localhost:3128 https://registry.terraform.io/.well-known/terraform.json`
4. Initialize terraform with `HTTP_PROXY=http://localhost:3128 terraform init`
5. Observe success output:
```
$ HTTP_PROXY=http://localhost:3128 terraform init

Initializing the backend...

Initializing provider plugins...
- Finding latest version of hashicorp/null...
- Installing hashicorp/null v2.1.2...
- Installed hashicorp/null v2.1.2 (signed by HashiCorp)

The following providers do not have any version constraints in configuration,
so the latest version was installed.

To prevent automatic upgrades to new major versions that may contain breaking
changes, we recommend adding version constraints in a required_providers block
in your configuration, with the constraint strings suggested below.

* hashicorp/null: version = "~> 2.1.2"

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```
