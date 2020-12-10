pipeline {
  agent none
    stages {      
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

                post {
                  success {
                    echo "Funcionou de buenas"
                  }
                  always {
                      cleanWs()
                  }
                }
            }

            
        } 
    }
    
}
