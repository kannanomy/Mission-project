pipeline {
    agent any
    tools{
        maven 'amazon-file-system'
    }
    stages{
        stage ('code build') {
            steps{
                sh 'mvn compile'    
            }
        }
        stage ('code test') {
            steps {
                sh 'mvn test'
            }
        }
        stage ('code package') {
            steps {
                sh 'mvn package'
            }
        }
        stage ('build docker image') {
        steps{
              sh 'docker build -t kannan65629/bg .'
            }
        }
        stage ('docker images push') {
            
            steps{ 
                withDockerRegistry(credentialsId: 'docker') {
                    sh 'docker push kannan65629/bg'
                }
            }
        }
        stage ('run as con') {
            steps{
                sh 'docker run -d -p 80:8080 --name bgcon kannan65629/bg'
            }
        } 
    }    
}