def sources = ["0-way.stl", "1-way.stl", "2-way.stl", "3-way.stl", "4-way.stl", "5-way.stl", "cover.stl", "demo_all.stl", "demo_assembled.stl", "demo_planter.stl", "demo_tray.stl", "demo_xways.stl", "planter.stl", "resevoir.stl", "tray.stl", "tube_with_hole.stl", "x-way.stl"]
def parallelStagesMap = sources.collectEntries {
  ["${it}" : generateStage(it)]
}

def generateStage(job) {
  return {
    stage("stage: ${job}") {
      container('main') {
        echo "This is ${job}." 
        sh "make ${job}"
      }
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
          sh 'apt-get install -y openstl'
          sh 'apt-get install -y make'
        }
      }
    }
    stage('Build') {
      steps {
        container('main') {
          script {
            parallel parallelStagesMap
          }
        }
      }
    }
  }
}