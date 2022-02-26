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
          sh 'apt-get upgrade'
          sh 'apt-get install -y openscad'
          sh 'apt-get install -y make'
        }
      }
    }
    stage('Build') {
      steps {
        container('main') {
          sh 'make'
        }
      }
    }
  }
}