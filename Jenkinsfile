pipeline {
    agent any

    tools {
        docker 'docker'
    }

    stages {
        stage('Build') { 
            steps {
                echo "Hello world!"
                // Get some code from a GitHub repository
                git 'https://github.com/dhpagani/spring-boot-oauth2-example.git'
                
                sh 'ls -la'
                
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
}
