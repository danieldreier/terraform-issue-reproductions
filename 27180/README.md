Reproduction case for https://github.com/hashicorp/terraform/issues/27180

Status: reproduced, unclear if bug or enhancement request

This reproduction case is restated using a null_resource rather than an AWS resource for the sake of easier local reproduction.

In this case, when `sensitive = true` is removed, this works. With `sensitive` set to true, it gives the error described, which is expected.

If I'm understanding this right, I think that this is an enhancement request, because this is a limitation (no way to remove sensitivity marks) rather than a bug in which existing workflows get broken.
