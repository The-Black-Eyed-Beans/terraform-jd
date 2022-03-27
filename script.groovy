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

def postSuccess(CLUSTER_TYPE) {
    if (CLUSTER_TYPE == "ECS" && !params.IS_DESTROYING) {
        sh 'curl -u BuildUser:$BUILD_USER_TOKEN -i "https://jenkins.theblackeyedbeans.net/job/aline-jd/job/Infrastructure as Code/job/ecs/build?token=$ECS_PIPELINE_TOKEN" > /dev/null'
    } else {sh 'curl -u BuildUser:$BUILD_USER_TOKEN -i "https://jenkins.theblackeyedbeans.net/job/aline-jd/job/Infrastructure as Code/job/eks/build?token=$EKS_PIPELINE_TOKEN" > /dev/null'}
}


return this