def src_folder = new File('./src/')
def parallelStagesMap

def generateStage(job) {
  return {
    stage("stage: ${job}") {
      echo "This is ${job}." // TODO
    }
  }
}

pipeline {
  agent {
    kubernetes {
      yaml '''
        apiVersion: v1
        kind: Pod
        spec:
          containers:
            - name: main
              image: ubuntu:latest
              command:
                - cat
              tty: true
              securityContext:
                allowPivilegedEscalation: true
                runAsUser: 0
                runAsGroup: 0
        '''
    }
  }
  stages {
    stage('Setup') {
      steps {
        container('main') {
          sh 'apt-get update'
          sh 'apt-get upgrade -y'
          sh 'apt-get install -y openscad'
          sh 'apt-get install -y make'
        }
      }
    }
    stage('pre-Build') {
      steps {
        script {
          parallelStagesMap = src_folder.eachFile {
            ["${it}" : generateStage(it)]
          }
        }
      }
    }
    stage('Build') {
      steps {
        script {
          parallel parallelStagesMap
        }
      }
    }
  }
}