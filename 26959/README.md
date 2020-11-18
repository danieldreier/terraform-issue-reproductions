Repro for https://github.com/hashicorp/terraform/issues/26959

1. `cd vault && terraform apply -auto-approve && cd -`
1. `cd sql && terraform apply -auto-approve`
1. `terraform plan`

Issue reporter states that the second plan shows a change, but this repro currently does not achieve this.
