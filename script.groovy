def init() {
    env.BUCKET = sh(returnStdout: true, script: """cat backend.json | jq -r '.["BUCKET"]'""").trim()
    env.REGION = sh(returnStdout: true, script: """cat backend.json | jq -r '.["REGION"]'""").trim()
    sh """
        terraform init \
            -no-color \
            -backend-config="bucket=${BUCKET}" \
            -backend-config="key=terraform/tf-output.json" \
            -backend-config="region=${REGION}" \
            -backend-config="profile=${PROFILE}" \
            -backend-config="shared_config_files=${SHARED_CONFIG_FILES}"
            -backend-config="shared_credentials_files=${SHARED_CREDENTIALS_FILES}"
    """
}

def plan() {
    if (!params.IS_DESTROYING) {
        sh "terraform plan -out=tfplan"
    }
}

def apply() {
    if (!params.IS_DESTROYING) {
        sh "terraform apply tfplan"
    }
}

def postAlways() {
    if (params.IS_DESTROYING) {
        sh "terraform destroy -auto-approve"
    }
}

def postCleanup() {
    sh "rm -rf ./*"
}

return this