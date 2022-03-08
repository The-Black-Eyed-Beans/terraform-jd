def gv

pipeline {
  agent any

  parameters {
    booleanParam(name: "IS_DESTROYING", defaultValue: "false", description: "Set to false to destroy, default true.")
  }

  stages {
    stage("init") {
      steps {
          script {
            gv = load "script.groovy"
            }
        }
    }
    stage("Plan & Apply") {
      steps {
        script {
            dir("deployments/vpc") {
                gv.planAndApply()
            }
        }
      }
    }
  }
  post {
    always {
      script {
        dir("deployments/vpc") {
            gv.postAlways()
        }
      }
    }
    success {
      script {
        dir("deployments/vpc") {
          gv.postSuccess
        }
      }
    }
  }
}