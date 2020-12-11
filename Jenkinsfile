pipeline {
  agent { label 'docker' }
    stages {      
         stage('Build') {
            agent { 
              docker{ 
                 image 'maven:3-alpine' 
              }
            }
            steps {
                // Get some code from a GitHub repository
                // git 'https://github.com/dhpagani/spring-boot-oauth2-example.git'
                echo "Hello world!"
                sh 'env'
                sh 'ls -la'
                sh 'echo ${WORKSPACE}'
                sh 'mvn compile' 
          } 
      }    
  }
  post {
          success {
            echo "Funcionou de buenas"
          }
          cleanup {
             /* clean up our workspace */
            deleteDir() 
            /* clean up tmp directory */
            dir("${workspace}@tmp") {
                deleteDir()
            }
            /* clean up script directory */
            dir("${workspace}@script") {
                deleteDir()
            }
          }
  }  
    
}
