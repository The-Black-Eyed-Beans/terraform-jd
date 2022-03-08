def planAndApply() {
    if (!params.IS_DESTROYING) {
        sh "terraform init -input=false"
        sh "terraform plan -var-file=input.tfvars -out=tfplan -input=false && terraform apply tfplan -input=false"
    }
}

def postAlways() {
    if (params.IS_DESTROYING) {
        sh "terraform destroy -auto-approve -var-file=input.tfvars"
    }
}