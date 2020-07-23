Reproduction for [#25600](https://github.com/hashicorp/terraform/issues/25600)

This configuration isn't any _simpler_ than what's in the issue, but it *is* in
AWS, which is what the core team has the easiest access to.

This config gives the same error with Terraform v0.12.28 (original issue's
version) and master (as of time of writing: 0.13.0-rc1)

```
Error: Provider produced inconsistent final plan

When expanding the plan for aws_autoscaling_group.web to include new values
learned so far during apply, provider "registry.terraform.io/hashicorp/aws"
produced an invalid new value for .tag: planned set element
cty.ObjectVal(map[string]cty.Value{"key":cty.UnknownVal(cty.String),
"propagate_at_launch":cty.UnknownVal(cty.Bool),
"value":cty.UnknownVal(cty.String)}) does not correlate with any element in
actual.

This is a bug in the provider, which should be reported in the provider's own
issue tracker.
```

This is not a bug in the provider, but an ordering issue, as we only refresh data sources at the start of an apply: 

aws_instance.test is created -> 
data.aws_instance_test references aws_instance -> 
aws_autoscaling_group.web uses the datasource lookup with for_each to create tags

There are two workarounds: 
* run `terraform apply` twice:
   *  it will fail the first time, but the instance is created, so the data source returns a known value on the second run
* run a targeted apply. Same end result as above, without the failure: 
    * `terraform apply --target aws_instance.test`, then `terraform apply`


We have a few proposals being researched now which may resolve this: partial applies and merging refresh and plan.
