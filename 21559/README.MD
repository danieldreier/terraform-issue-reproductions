Reproduction case for https://github.com/hashicorp/terraform/issues/21559

Status: unable to reproduce

Output of `run.sh`:
```
+ rm -rf .terraform terraform.tfstate terraform.tfstate.backup foo.plan
+ terraform-v0.12.26 init -no-color
Initializing modules...
- ue1 in modules/ue1
- ue1.core1 in modules/core1
- ue1.core1.config in modules/config
- ue1.core1.config.live in modules/live
- ue1.core1.config.live.foo in modules/foo
- ue1.core2 in modules/core2
- ue1.core2.config in modules/config
- ue1.core2.config.live in modules/live
- ue1.core2.config.live.foo in modules/foo
- uw2 in modules/uw2
- uw2.core1 in modules/core1
- uw2.core1.config in modules/config
- uw2.core1.config.live in modules/live
- uw2.core1.config.live.foo in modules/foo
- uw2.core2 in modules/core2
- uw2.core2.config in modules/config
- uw2.core2.config.live in modules/live
- uw2.core2.config.live.foo in modules/foo

Initializing the backend...

Initializing provider plugins...
- Checking for available provider plugins...
- Downloading plugin for provider "local" (hashicorp/local) 1.4.0...
- Downloading plugin for provider "random" (hashicorp/random) 2.2.1...

The following providers do not have any version constraints in configuration,
so the latest version was installed.

To prevent automatic upgrades to new major versions that may contain breaking
changes, it is recommended to add version = "..." constraints to the
corresponding provider blocks in configuration, with the constraint strings
suggested below.

* provider.local: version = "~> 1.4"
* provider.random: version = "~> 2.2"

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
+ terraform-v0.12.26 plan -no-color -out foo.plan
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

module.ue1.module.core2.module.config.module.live.module.foo.data.local_file.foo: Refreshing state...
module.ue1.module.core1.module.config.module.live.module.foo.data.local_file.foo: Refreshing state...
module.uw2.module.core2.module.config.module.live.module.foo.data.local_file.foo: Refreshing state...
module.uw2.module.core1.module.config.module.live.module.foo.data.local_file.foo: Refreshing state...

------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.ue1.module.core1.random_pet.core will be created
  + resource "random_pet" "core" {
      + id        = (known after apply)
      + length    = 2
      + prefix    = "prodconfiga-and-prodconfigb"
      + separator = "-"
    }

  # module.ue1.module.core2.random_pet.core will be created
  + resource "random_pet" "core" {
      + id        = (known after apply)
      + length    = 2
      + prefix    = "prodconfiga-and-prodconfigb"
      + separator = "-"
    }

  # module.uw2.module.core1.random_pet.core will be created
  + resource "random_pet" "core" {
      + id        = (known after apply)
      + length    = 2
      + prefix    = "prodconfiga-and-prodconfigb"
      + separator = "-"
    }

  # module.uw2.module.core2.random_pet.core will be created
  + resource "random_pet" "core" {
      + id        = (known after apply)
      + length    = 2
      + prefix    = "prodconfiga-and-prodconfigb"
      + separator = "-"
    }

Plan: 4 to add, 0 to change, 0 to destroy.

------------------------------------------------------------------------

This plan was saved to: foo.plan

To perform exactly these actions, run the following command to apply:
    terraform apply "foo.plan"

+ terraform-v0.12.26 apply -no-color foo.plan
module.ue1.module.core2.random_pet.core: Creating...
module.uw2.module.core2.random_pet.core: Creating...
module.uw2.module.core1.random_pet.core: Creating...
module.ue1.module.core1.random_pet.core: Creating...
module.ue1.module.core2.random_pet.core: Creation complete after 0s [id=prodconfiga-and-prodconfigb-stable-mako]
module.uw2.module.core1.random_pet.core: Creation complete after 0s [id=prodconfiga-and-prodconfigb-keen-raptor]
module.ue1.module.core1.random_pet.core: Creation complete after 0s [id=prodconfiga-and-prodconfigb-expert-raptor]
module.uw2.module.core2.random_pet.core: Creation complete after 0s [id=prodconfiga-and-prodconfigb-choice-firefly]

Apply complete! Resources: 4 added, 0 changed, 0 destroyed.

The state of your infrastructure has been saved to the path
below. This state is required to modify and destroy your
infrastructure, so keep it safe. To inspect the complete state
use the `terraform show` command.

State path: terraform.tfstate

Outputs:

result = {
  "ue1" = "core: prodconfiga-and-prodconfigb-expert-raptor"
  "uw2" = "core: prodconfiga-and-prodconfigb-keen-raptor"
}
```
