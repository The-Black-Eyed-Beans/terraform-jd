def init() {
    env.BUCKET = sh(returnStdout: true, script: """cat backend.json | jq -r '.["BUCKET"]'""").trim()
    env.REGION = sh(returnStdout: true, script: """cat backend.json | jq -r '.["REGION"]'""").trim()
    sh """
        terraform init \
            -no-color \
            -backend-config="bucket=${BUCKET}" \
            -backend-config="key=${BUCKET_KEY}" \
            -backend-config="region=${REGION}" \
            -backend-config='profile=$AWS_PROFILE'
    """
}

def plan() {
    if (!env.IS_DESTROYING.toBoolean()) {
        sh "terraform plan -out=tfplan"
    }
}

def apply() {
    if (!env.IS_DESTROYING.toBoolean()) {
        sh "terraform apply tfplan"
    }
}

def postAlways() {
    if (env.IS_DESTROYING.toBoolean()) {
        sh "terraform destroy -auto-approve"
    }
}

def postCleanup() {
    sh "rm -rf ./*"
}

return this