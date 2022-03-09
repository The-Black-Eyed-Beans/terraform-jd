def planAndApply() {
    if (!params.IS_DESTROYING) {
        sh "terraform init -input=false"
        sh "terraform plan -out=tfplan -input=false && terraform apply tfplan"
    }
}

def postAlways() {
    if (params.IS_DESTROYING) {
        sh "terraform destroy -auto-approve"
    }
}

def postSuccess() {
    sh "terraform output -json > tf_output.json"
    sh "aws s3 cp tf_output.json s3://beb-bucket-jd/terraform/ --profile joshua"
}

return this