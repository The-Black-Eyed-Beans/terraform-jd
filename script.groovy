def planAndApply() {
    if (params.IS_DESTROYING == false) {
        sh "terraform init -input=false"
        sh "terraform plan -var-file=input.tfvars -out=tfplan -input=false && terraform apply tfplan"
    }
}

def postAlways() {
    if (params.IS_DESTROYING) {
        sh "terraform destroy -auto-approve -var-file=input.tfvars"
    }
}

def postSuccess() {
    sh "terraform output -json > tf_output.json"
    sh "aws s3 cp tf_output.json s3://beb-bucket-jd/terraform/ --profile joshua"
}

return this