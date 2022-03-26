

def init() {
    if (!params.IS_DESTROYING) {
        env.BUCKET = sh(returnStdout: true, script: """cat backend.json | jq '.["BUCKET"]'""").trim()
        env.REGION = sh(returnStdout: true, script: """cat backend.json | jq '.["REGION"]'""").trim()
        sh "terraform init"
        sh "terraform plan -out=tfplan"
    }
}

def plan() {
    if (!params.IS_DESTROYING) {
        sh "terraform plan -out=tfplan -input=false"
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