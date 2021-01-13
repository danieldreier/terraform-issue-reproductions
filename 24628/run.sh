terraform init
terraform apply -auto-approve
terraform plan -out validate.plan
terraform show -json validate.plan | jq '.output_changes'