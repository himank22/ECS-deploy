pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t my-app:latest .'
            }
        }

        stage('Stop Old Container') {
            steps {
                sh 'docker stop my-app || true'
                sh 'docker rm my-app || true'
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker run -d --name my-app -p 80:80 my-app:latest'
            }
        }
    }

    post {
        success {
            echo 'Application deployed successfully!'
        }

        failure {
            echo 'Deployment failed!'
        }
    }
}
