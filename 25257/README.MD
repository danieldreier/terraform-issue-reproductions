Issue reproduction for https://github.com/hashicorp/terraform/issues/25257

Status: 

tried to reproduce with a simple null resource to show that this does not generalize to all terraform strings. Unable to reproduce in that case. Waiting on further clarification.


```
❯ terraform apply -auto-approve
null_resource.example: Creating...
null_resource.example: Provisioning with 'local-exec'...
null_resource.example (local-exec): Executing: ["/bin/sh" "-c" "echo \"/* hello world */\""]
null_resource.example (local-exec): /* hello world */
null_resource.example: Creation complete after 0s [id=5065262998816776078]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```
