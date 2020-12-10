pipeline {
  agent {
    docker {
      image 'maven'
      args 'mvn install'
    }

  }
  stages {
    stage('build') {
      steps {
        build 'buidão'
      }
    }

  }
}