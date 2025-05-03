pipeline {
    agent any

    environment {
        DOCKER_USERNAME = credentials('docker-username')
        DOCKER_PASSWORD = credentials('docker-password')
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin'
                    sh 'docker build -t myapp:${env.BUILD_ID} .'
                }
            }
        }
        stage('Run Tests') {
            steps {
                script {
                    sh 'docker run myapp:${env.BUILD_ID} npm test'
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    sh 'docker run -d -p 5000:5000 myapp:${env.BUILD_ID}'
                }
            }
        }
    }
}