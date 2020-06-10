set -x

terraform init
terraform apply -auto-approve
terraform destroy -auto-approve
mv terraform.tfstate.backup terraform.tfstate
terraform destroy -auto-approve
mv terraform.tfstate.backup terraform.tfstate
terraform destroy -auto-approve
mv terraform.tfstate.backup terraform.tfstate
terraform destroy -auto-approve
