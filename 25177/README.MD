Issue reproduction for https://github.com/hashicorp/terraform/issues/25177

Status: reproduced on 0.13.0 beta 1

```
2020/06/08 17:27:39 [INFO] Terraform version: 0.13.0 beta1 
2020/06/08 17:27:39 [INFO] Go runtime version: go1.14.2
2020/06/08 17:27:39 [INFO] CLI args: []string{"/usr/local/bin/terraform", "init"}
2020/06/08 17:27:39 [DEBUG] Attempting to open CLI config file: /Users/danieldreier/.terraformrc
2020/06/08 17:27:39 Loading CLI configuration from /Users/danieldreier/.terraformrc
2020/06/08 17:27:39 [DEBUG] ignoring non-existing provider search directory terraform.d/plugins
2020/06/08 17:27:39 [DEBUG] ignoring non-existing provider search directory /Users/danieldreier/Library/Application Support/io.terraform/plugins
2020/06/08 17:27:39 [DEBUG] ignoring non-existing provider search directory /Library/Application Support/io.terraform/plugins
2020/06/08 17:27:39 [INFO] CLI command args: []string{"init"}
2020/06/08 17:27:39 [TRACE] Meta.Backend: no config given or present on disk, so returning nil config
2020/06/08 17:27:39 [TRACE] Meta.Backend: backend has not previously been initialized in this working directory
2020/06/08 17:27:39 [DEBUG] New state was assigned lineage "00397ef1-e110-ef63-fb73-b6f2ab9b9ce2"
2020/06/08 17:27:39 [TRACE] Meta.Backend: using default local state only (no backend configuration, and no existing initialized backend)
2020/06/08 17:27:39 [TRACE] Meta.Backend: instantiated backend of type <nil>
2020/06/08 17:27:39 [DEBUG] checking for provisioner in "."
2020/06/08 17:27:39 [DEBUG] checking for provisioner in "/usr/local/bin"
2020/06/08 17:27:39 [INFO] Failed to read plugin lock file .terraform/plugins/darwin_amd64/lock.json: open .terraform/plugins/darwin_amd64/lock.json: no such file or directory
2020/06/08 17:27:39 [TRACE] Meta.Backend: backend <nil> does not support operations, so wrapping it in a local backend
2020/06/08 17:27:39 [TRACE] backend/local: state manager for workspace "default" will:
 - read initial snapshot from terraform.tfstate
 - write new snapshots to terraform.tfstate
 - create any backup at terraform.tfstate.backup
2020/06/08 17:27:39 [TRACE] statemgr.Filesystem: reading initial snapshot from terraform.tfstate
2020/06/08 17:27:39 [TRACE] statemgr.Filesystem: snapshot file has nil snapshot, but that's okay
2020/06/08 17:27:39 [TRACE] statemgr.Filesystem: read nil snapshot
panic: invalid specification "~>1.16": a space separator is required after the operator "~>"

goroutine 1 [running]:
github.com/hashicorp/terraform/internal/getproviders.MustParseVersionConstraints(0xc000586648, 0x6, 0x1, 0xc000586648, 0x6)
	/home/circleci/project/project/internal/getproviders/types.go:96 +0x80
github.com/hashicorp/terraform/configs.(*Config).addProviderRequirements(0xc000595040, 0xc000535cb0, 0x100, 0xc000030000, 0x100)
	/home/circleci/project/project/configs/config.go:233 +0x8d1
github.com/hashicorp/terraform/configs.(*Config).ProviderRequirements(...)
	/home/circleci/project/project/configs/config.go:177
github.com/hashicorp/terraform/command.(*InitCommand).getProviders(0xc000522700, 0xc000595040, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, ...)
	/home/circleci/project/project/command/init.go:416 +0x77
github.com/hashicorp/terraform/command.(*InitCommand).Run(0xc000522700, 0xc0000a6030, 0x0, 0x0, 0xc00046e0d0)
	/home/circleci/project/project/command/init.go:282 +0x12f7
github.com/mitchellh/cli.(*CLI).Run(0xc000382280, 0xc000382280, 0xc0006bfd48, 0x1)
	/home/circleci/project/project/vendor/github.com/mitchellh/cli/cli.go:255 +0x1da
main.wrappedMain(0x0)
	/home/circleci/project/project/main.go:275 +0xc90
main.realMain(0x0)
	/home/circleci/project/project/main.go:106 +0xde
main.main()
	/home/circleci/project/project/main.go:42 +0x3a
```
