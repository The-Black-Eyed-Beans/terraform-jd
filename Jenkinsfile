def gv

pipeline {
  agent {
    node {
      label "worker-one"
    }
  }
  
  tools {
    terraform 'Terraform'
  }

  environment {
    PROFILE = credentials("profile")
    HOME = credentials("home")
  }

  parameters {
    booleanParam(name: "IS_DESTROYING", defaultValue: "false", description: "Set to false to destroy, default true.")
  }

  stages {
    stage("init") {
      steps {
        checkout([$class: 'GitSCM', branches: [[name: '*/dev']], extensions: [], userRemoteConfigs: [[credentialsId: '8144cd2a-3eab-4735-948a-7ec9e898acc4', url: 'https://github.com/The-Black-Eyed-Beans/terraform-jd.git']]])
        script {
          gv = load "script.groovy"
        }
        dir("deployments/ecs") {
          sh 'aws s3 cp s3://beb-bucket-jd/terraform/backend.json backend.json --quiet --profile $PROFILE'
          sh 'aws s3 cp s3://beb-bucket-jd/terraform/terraform.tfvars terraform.tfvars --quiet --profile $PROFILE'
          script {
            gv.init()
          }
        }
      }
    }
    stage("Construct Plan") {
      steps {
        script {
          try{
            dir("deployments/ecs") {
                gv.plan()
            }
          }catch (Exception e){
              echo "Plan failed! Do something =O"
          }
        }
      }
    }
    stage("Apply Plan") {
      steps {
        script {
          try{
            dir("deployments/ecs") {
                gv.apply()
            }
          }catch (Exception e){
              echo "Apply failed! Do something =O"
          }
        }
      }
    }
  }
  post {
    always {
      script {
        dir("deployments/ecs") {
            gv.postAlways()
        }
      }
    }
    cleanup {
      script {
        gv.postCleanup()
      }
    }
  }
}