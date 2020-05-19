reproduction case for https://github.com/hashicorp/terraform/issues/24838

status: verified

```
bash-3.2$ ./run.sh
+ terraform init

Initializing the backend...

Initializing provider plugins...
- Checking for available provider plugins...
- Downloading plugin for provider "aws" (hashicorp/aws) 2.62.0...

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
+ terraform validate
panic: runtime error: invalid memory address or nil pointer dereference
[signal SIGSEGV: segmentation violation code=0x1 addr=0x8 pc=0x19f821e]
goroutine 1 [running]:
github.com/hashicorp/terraform/lang/blocktoattr.walkVariables(0x3038440, 0xc00057c8f0, 0x0, 0xc0000cc001, 0x3038440, 0xc00057c8f0, 0x0, 0x0, 0x0, 0x66)
        /opt/teamcity-agent/work/9e329aa031982669/src/github.com/hashicorp/terraform/lang/blocktoattr/variables.go:34 +0x1ae
github.com/hashicorp/terraform/lang/blocktoattr.ExpandedVariables(...)
        /opt/teamcity-agent/work/9e329aa031982669/src/github.com/hashicorp/terraform/lang/blocktoattr/variables.go:24
github.com/hashicorp/terraform/lang.ReferencesInBlock(0x3038440, 0xc00057c8f0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0xc000172a80)
        /opt/teamcity-agent/work/9e329aa031982669/src/github.com/hashicorp/terraform/lang/references.go:68 +0x66
github.com/hashicorp/terraform/terraform.(*NodeAbstractResource).References(0xc000718000, 0x0, 0x0, 0x0)
        /opt/teamcity-agent/work/9e329aa031982669/src/github.com/hashicorp/terraform/terraform/node_resource_abstract.go:195 +0x33d
github.com/hashicorp/terraform/terraform.NewReferenceMap(0xc000a0f4a0, 0x3, 0x3, 0x3)
        /opt/teamcity-agent/work/9e329aa031982669/src/github.com/hashicorp/terraform/terraform/transform_reference.go:492 +0x24a
github.com/hashicorp/terraform/terraform.(*ReferenceTransformer).Transform(0x424b690, 0xc0004b01e0, 0x14, 0x0)
        /opt/teamcity-agent/work/9e329aa031982669/src/github.com/hashicorp/terraform/terraform/transform_reference.go:79 +0x71
github.com/hashicorp/terraform/terraform.(*BasicGraphBuilder).Build(0xc0008a9748, 0x0, 0x0, 0x0, 0x422ba00, 0xc0008a9778, 0x10e28d0, 0xc0000cc000)
        /opt/teamcity-agent/work/9e329aa031982669/src/github.com/hashicorp/terraform/terraform/graph_builder.go:50 +0x477
github.com/hashicorp/terraform/terraform.(*PlanGraphBuilder).Build(0xc000342230, 0x0, 0x0, 0x0, 0x1, 0x2baa4e0, 0xc0001dab01, 0xc0008a97d8)
        /opt/teamcity-agent/work/9e329aa031982669/src/github.com/hashicorp/terraform/terraform/graph_builder_plan.go:65 +0xbc
github.com/hashicorp/terraform/terraform.(*Context).Graph(0xc00044c0f0, 0x6, 0xc0008a97ce, 0xc00062a000, 0xc0005c88f8, 0xc0005cbce0, 0xc0001493b0)
        /opt/teamcity-agent/work/9e329aa031982669/src/github.com/hashicorp/terraform/terraform/context.go:292 +0x1b8
github.com/hashicorp/terraform/terraform.(*Context).Validate(0xc00044c0f0, 0x0, 0x0, 0x0)
        /opt/teamcity-agent/work/9e329aa031982669/src/github.com/hashicorp/terraform/terraform/context.go:675 +0xc9
github.com/hashicorp/terraform/command.(*ValidateCommand).validate(0xc0000f7ba0, 0xc0005cea80, 0x3e, 0x0, 0x0, 0x0)
        /opt/teamcity-agent/work/9e329aa031982669/src/github.com/hashicorp/terraform/command/validate.go:127 +0x4f9
github.com/hashicorp/terraform/command.(*ValidateCommand).Run(0xc0000f7ba0, 0xc0000c8010, 0x0, 0x0, 0xc000148ab0)
        /opt/teamcity-agent/work/9e329aa031982669/src/github.com/hashicorp/terraform/command/validate.go:83 +0x752
github.com/mitchellh/cli.(*CLI).Run(0xc0005d3e00, 0xc0005d3e00, 0xc00053bd90, 0x1)
        /opt/teamcity-agent/work/9e329aa031982669/pkg/mod/github.com/mitchellh/cli@v1.0.0/cli.go:255 +0x1f1
main.wrappedMain(0x0)
        /opt/teamcity-agent/work/9e329aa031982669/src/github.com/hashicorp/terraform/main.go:239 +0xc33
main.realMain(0x0)
        /opt/teamcity-agent/work/9e329aa031982669/src/github.com/hashicorp/terraform/main.go:103 +0xb4
main.main()
        /opt/teamcity-agent/work/9e329aa031982669/src/github.com/hashicorp/terraform/main.go:39 +0x3b



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
```