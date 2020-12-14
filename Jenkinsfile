pipeline {
  agent { label 'docker' }
    stages {      
         stage('Build') {
            agent { 
                docker{ 
                    image 'maven:3-alpine' 
                    args '-v "${WORKSPACE}-m2":/root/.m2/repository'
                    reuseNode true
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
      } ,

      stage('Unit test')  {
        agent { 
                docker{ 
                    image 'maven:3-alpine' 
                    args '-v "${WORKSPACE}-m2":/root/.m2/repository'
                    reuseNode true
                } 
            }
        steps {
          sh 'mvn test'
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
