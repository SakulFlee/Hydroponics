// Source fiels
def sources = ["0_way.scad", "1_way.scad", "2_way.scad", "3_way.scad", "4_way.scad", "5_way.scad", "cover.scad", "demo_assembled.scad", "demo_planter.scad", "demo_tray.scad", "demo_xways.scad", "planter.scad", "resevoir.scad", "tray.scad", "tube_with_hole.scad", "demo_sidecut.scad", "stand.scad", "demo_stand.scad"]

// High-Quality Models
def HQ = sources.collectEntries {
  ["${it}_HQ" : generateStage(it, 150)]
}
// Normal-Quality Models
def NQ = sources.collectEntries {
  ["${it}_NQ" : generateStage(it, 100)]
}
// Low-Quality Models
def LQ = sources.collectEntries {
  ["${it}_LQ" : generateStage(it, 25)]
}

def generateStage(job, quality) {
  return {
    stage("stage: ${job}_Q${quality}") {
      container('main') {
        sh """
          basefile=\$(basename "${job}")
          scad_file="\${basefile%.*}.scad"
          stl_file="\${basefile%.*}_Q${quality}.stl"
          
          if [ ! -d  build/ ]; then mkdir build/; fi
          openscad \
            -D '\$fn=${quality}' \
            -o build/\$stl_file \
            src/\$scad_file
        """
        archiveArtifacts artifacts: 'build/*.stl', fingerprint: true
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
              resources:
                limits:
                  memory: 2G
                  cpu: "1"
        '''
    }
  }
  options { 
    disableConcurrentBuilds() 
    timeout(time: 2, unit: 'HOURS')
  }
  stages {
    stage('Setup') {
      steps {
        container('main') {
          sh 'apt-get update'
          sh 'apt-get upgrade -y'
          sh 'apt-get install -y openscad'
        }
      }
    }
    stage('LQ') {
      steps {
        container('main') {
          script {
            parallel LQ
          }
        }
      }
    }
    stage('NQ') {
      steps {
        container('main') {
          script {
            parallel NQ
          }
        }
      }
    }
    stage('HQ') {
      steps {
        container('main') {
          script {
            parallel HQ
          }
        }
      }
    }
  }
}