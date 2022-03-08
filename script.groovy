def planAndApply() {
  sh "terraform init -input=false"
  sh "terraform plan -var-file=input.tfvars -out=tfplan -input=false && terraform apply tfplan -input=false"
}