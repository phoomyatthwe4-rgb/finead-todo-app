pipeline {
    agent any

    environment {
        DOCKER_USER = "phoomyatthwe4-rgb"
        APP_NAME = "finead-todo-app"
    }

    stages {

        stage('Build') {
            steps {
                sh 'npm install'
            }
        }

        stage('Containerise') {
            steps {
                sh 'docker build -t $DOCKER_USER/$APP_NAME:latest .'
            }
        }

        stage('Push') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub',
                    usernameVariable: 'DOCKER_USERNAME',
                    passwordVariable: 'DOCKER_PASSWORD'
                )]) {

                    sh 'echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin'
                    sh 'docker push $DOCKER_USER/$APP_NAME:latest'
                }
            }
        }

    }
}
