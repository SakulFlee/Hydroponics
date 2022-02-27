// Source fiels
def sources = ["0-way.scad", "1-way.scad", "2-way.scad", "3-way.scad", "4-way.scad", "5-way.scad", "cover.scad", "demo_all.scad", "demo_assembled.scad", "demo_planter.scad", "demo_tray.scad", "demo_xways.scad", "planter.scad", "resevoir.scad", "tray.scad", "tube_with_hole.scad"]

// Ultra High-Quality Models
def UHQ = sources.collectEntries {
  ["${it}" : generateStage(it, 300)]
}
// High-Quality Models
def HQ = sources.collectEntries {
  ["${it}" : generateStage(it, 150)]
}
// Normal-Quality Models
def NQ = sources.collectEntries {
  ["${it}" : generateStage(it, 100)]
}
// Low-Quality Models
def LQ = sources.collectEntries {
  ["${it}" : generateStage(it, 50)]
}
// Ultra Low-Quality Models
def ULQ = sources.collectEntries {
  ["${it}" : generateStage(it, 25)]
}

// All stages combined
def parallelStagesMap = UHQ + HQ + NQ + LQ + ULQ

def generateStage(job, quality) {
  return {
    stage("stage: ${job}") {
      container('main') {
        sh """
          basefile=\$(basename "${job}")
          scad_file="\${basefile%.*}.scad"
          stl_file="\${basefile%.*}_Q${quality}.stl"
          
          if [ ! -d  build/ ]; then mkdir build/; fi
          openscad --D \$\$fn=${quality} -o build/\$stl_file src/\$scad_file
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