pipeline {
  agent none
    stages {
      stage('env') { 
        agent any
        steps { 
          sh 'env'
        }
      }
         stage('Build') {
            agent { docker{ 
               image 'maven:3-alpine' 
               customWorkspace "${WORKSPACE}/${BUILD_NUMBER}"
              }
            }
            steps {
                // Get some code from a GitHub repository
                git 'https://github.com/dhpagani/spring-boot-oauth2-example.git'
                echo "Hello world!"
                sh 'env'
                sh 'ls -la'
                sh 'mvn compile'
            }

            post {
                // If Maven was able to run the tests, even if some of the test
                // failed, record the test results and archive the jar file.
                success {
                  echo "Funcionou de buenas"
                }
            }
        } 
    }
    post { 
      always {
          cleanWs()
      }
    }
}
