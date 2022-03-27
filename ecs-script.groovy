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

def plan(IS_DESTROYING) {
    if (!IS_DESTROYING) {
        sh "terraform plan -out=tfplan"
    }
}

def apply(IS_DESTROYING) {
    if (!IS_DESTROYING) {
        sh "terraform apply tfplan"
    }
}

def postAlways(IS_DESTROYING) {
    if (IS_DESTROYING) {
        sh "terraform destroy -auto-approve"
    }
}

def postCleanup() {
    sh "rm -rf ./*"
}

return this