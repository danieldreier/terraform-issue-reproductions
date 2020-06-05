Reproduction case for https://github.com/hashicorp/terraform/issues/23369

Status: unable to reproduce. This produces the error:
```
Error: Failed to instantiate provisioner "multi-remote-exec" to obtain schema: unknown provisioner "multi-remote-exec"
```

I think that this relates to a provisioner that isn't in core.
