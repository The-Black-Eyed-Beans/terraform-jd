



def init() {
    env.BUCKET = sh(returnStdout: true, script: """cat backend.json | jq '.["BUCKET"]'""").trim()
    env.REGION = sh(returnStdout: true, script: """cat backend.json | jq '.["REGION"]'""").trim()
    sh """
        terraform init \
            -no-color \
            -backend-config='bucket=${BUCKET}' \
            -backend-config='key=terraform/tf-output.json' \
            -backend-config='region=${REGION}' \
            -backend-config="profile=${PROFILE}"
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