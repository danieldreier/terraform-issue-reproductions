Reproduction case for https://github.com/hashicorp/terraform/issues/24990
Status: unable to reproduce

Expected output
```
bash run.sh                                                                                                                                                                   ✔  2668  14:42:51
+ rm -rf .terraform/ terraform.tfstate terraform.tfstate.1589924331.backup
+ terraform init
Initializing modules...
- mymodule in modules/mymodule

Initializing the backend...

Initializing provider plugins...
- Checking for available provider plugins...
- Downloading plugin for provider "null" (hashicorp/null) 2.1.2...

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
+ terraform apply -no-color -auto-approve
null_resource.example["foo"]: Creating...
module.mymodule.null_resource.example-in-module["fizz"]: Creating...
null_resource.example["fizz"]: Creating...
module.mymodule.null_resource.example-in-module["foo"]: Creating...
module.mymodule.null_resource.example-in-module["fizz"]: Provisioning with 'local-exec'...
module.mymodule.null_resource.example-in-module["foo"]: Provisioning with 'local-exec'...
null_resource.example["fizz"]: Provisioning with 'local-exec'...
null_resource.example["foo"]: Provisioning with 'local-exec'...
null_resource.example["foo"] (local-exec): Executing: ["/bin/sh" "-c" "echo hello foo"]
module.mymodule.null_resource.example-in-module["fizz"] (local-exec): Executing: ["/bin/sh" "-c" "echo hello fizz"]
module.mymodule.null_resource.example-in-module["foo"] (local-exec): Executing: ["/bin/sh" "-c" "echo hello foo"]
null_resource.example["fizz"] (local-exec): Executing: ["/bin/sh" "-c" "echo hello fizz"]
null_resource.example["foo"] (local-exec): hello foo
null_resource.example["foo"]: Creation complete after 0s [id=5439571334355292902]
module.mymodule.null_resource.example-in-module["foo"] (local-exec): hello foo
module.mymodule.null_resource.example-in-module["fizz"] (local-exec): hello fizz
null_resource.example["fizz"] (local-exec): hello fizz
null_resource.example["fizz"]: Creation complete after 0s [id=6603606421301991644]
module.mymodule.null_resource.example-in-module["foo"]: Creation complete after 0s [id=2634081090760273693]
module.mymodule.null_resource.example-in-module["fizz"]: Creation complete after 0s [id=7691577251520060560]

Apply complete! Resources: 4 added, 0 changed, 0 destroyed.
+ terraform state rm 'null_resource.example["foo"]'
Removed null_resource.example["foo"]
Successfully removed 1 resource instance(s).
+ terraform state rm 'module.mymodule.null_resource.example-in-module["fizz"]'
Removed module.mymodule.null_resource.example-in-module["fizz"]
Successfully removed 1 resource instance(s).
```

