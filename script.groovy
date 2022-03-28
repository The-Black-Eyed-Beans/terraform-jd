def init() {
    env.BUCKET = sh(returnStdout: true, script: """cat backend.json | jq -r '.["BUCKET"]'""").trim()
    env.REGION = sh(returnStdout: true, script: """cat backend.json | jq -r '.["REGION"]'""").trim()
    sh """
        terraform init \
            -no-color \
            -backend-config="bucket=${BUCKET}" \
            -backend-config='key=$BUCKET_KEY' \
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

def postSuccess() {
    if (!env.IS_DESTROYING.toBoolean()) {
        if (CLUSTER_TYPE == "ECS") {
            sh 'curl -u BuildUser:$BUILD_USER_TOKEN -i "https://jenkins.theblackeyedbeans.net/job/aline-jd/job/Infrastructure as Code/job/ecs/build?token=$ECS_PIPELINE_TOKEN" > /dev/null'
        } else {sh 'curl -u BuildUser:$BUILD_USER_TOKEN -i "https://jenkins.theblackeyedbeans.net/job/aline-jd/job/Infrastructure as Code/job/eks/build?token=$EKS_PIPELINE_TOKEN" > /dev/null'}
    }
}


return this