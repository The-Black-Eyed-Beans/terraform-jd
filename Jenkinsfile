def gv

pipeline {
  agent any

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
          gv.planAndApply()
        }
      }
    }
  }
}