# Issue reproduction for 0.14.0 ignore_changes issue

https://github.com/hashicorp/terraform/issues/27097

Reproduction on AWS:

0.13.5 shows no changes on repeated apply
```
bash-3.2$ terraform-v0.13.5 apply -auto-approve
data.aws_vpc.default: Refreshing state...
aws_security_group.terraform-0-14-test: Creating...
aws_security_group.terraform-0-14-test: Creation complete after 4s [id=sg-020b1ae84a440a140]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
bash-3.2$ terraform-v0.13.5 apply -auto-approve
data.aws_vpc.default: Refreshing state... [id=vpc-5ed6853b]
aws_security_group.terraform-0-14-test: Refreshing state... [id=sg-020b1ae84a440a140]

Apply complete! Resources: 0 added, 0 changed, 0 destroyed.
bash-3.2$ terraform-v0.13.5 apply -auto-approve
data.aws_vpc.default: Refreshing state... [id=vpc-5ed6853b]
aws_security_group.terraform-0-14-test: Refreshing state... [id=sg-020b1ae84a440a140]

Apply complete! Resources: 0 added, 0 changed, 0 destroyed.
```

0.14.0 shows no changes on repeated apply
```
bash-3.2$ terraform-v0.14.0 apply -auto-approve
aws_security_group.terraform-0-14-test: Creating...
aws_security_group.terraform-0-14-test: Creation complete after 3s [id=sg-0f38681735f41657b]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
bash-3.2$ terraform-v0.14.0 apply -auto-approve
aws_security_group.terraform-0-14-test: Refreshing state... [id=sg-0f38681735f41657b]

Apply complete! Resources: 0 added, 0 changed, 0 destroyed.
bash-3.2$ terraform-v0.14.0 apply -auto-approve
aws_security_group.terraform-0-14-test: Refreshing state... [id=sg-0f38681735f41657b]

Apply complete! Resources: 0 added, 0 changed, 0 destroyed.
```

null_resource example
0.13.5 behavior:
```
bash-3.2$ terraform-v0.13.5 apply -auto-approve
null_resource.repro: Creating...
null_resource.repro: Creation complete after 0s [id=4809662256601474538]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
bash-3.2$ terraform-v0.13.5 apply -auto-approve
null_resource.repro: Refreshing state... [id=4809662256601474538]

Apply complete! Resources: 0 added, 0 changed, 0 destroyed.
bash-3.2$ terraform-v0.13.5 apply -auto-approve
null_resource.repro: Refreshing state... [id=4809662256601474538]

Apply complete! Resources: 0 added, 0 changed, 0 destroyed.
```

0.14.0 behavior (disregards ignore_changes):
```
bash-3.2$ terraform-v0.14.0 apply -auto-approve
null_resource.repro: Refreshing state... [id=4809662256601474538]
null_resource.repro: Destroying... [id=4809662256601474538]
null_resource.repro: Destruction complete after 0s
null_resource.repro: Creating...
null_resource.repro: Creation complete after 0s [id=534066792835234939]

Apply complete! Resources: 1 added, 0 changed, 1 destroyed.
bash-3.2$ terraform-v0.14.0 apply -auto-approve
null_resource.repro: Refreshing state... [id=534066792835234939]
null_resource.repro: Destroying... [id=534066792835234939]
null_resource.repro: Destruction complete after 0s
null_resource.repro: Creating...
null_resource.repro: Creation complete after 0s [id=6477963953769499652]

Apply complete! Resources: 1 added, 0 changed, 1 destroyed.
bash-3.2$ terraform-v0.14.0 apply -auto-approve
null_resource.repro: Refreshing state... [id=6477963953769499652]
null_resource.repro: Destroying... [id=6477963953769499652]
null_resource.repro: Destruction complete after 0s
null_resource.repro: Creating...
null_resource.repro: Creation complete after 0s [id=7179303108771723839]

Apply complete! Resources: 1 added, 0 changed, 1 destroyed.
```

Behavior in local build from v0.14 branch after fix was backported in:
```
bash-3.2$ /Users/danieldreier/.go/bin/terraform apply -auto-approve
null_resource.repro: Refreshing state... [id=7179303108771723839]
null_resource.repro: Destroying... [id=7179303108771723839]
null_resource.repro: Destruction complete after 0s
null_resource.repro: Creating...
null_resource.repro: Creation complete after 0s [id=7692704669428117636]

Apply complete! Resources: 1 added, 0 changed, 1 destroyed.
bash-3.2$ /Users/danieldreier/.go/bin/terraform apply -auto-approve
null_resource.repro: Refreshing state... [id=7692704669428117636]
null_resource.repro: Destroying... [id=7692704669428117636]
null_resource.repro: Destruction complete after 0s
null_resource.repro: Creating...
null_resource.repro: Creation complete after 0s [id=231103720647473386]

Apply complete! Resources: 1 added, 0 changed, 1 destroyed.
```
