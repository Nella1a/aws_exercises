#! /usr/bin/env groovy

pipeline {
    agent any

    stages {
        stage('Test') {
            steps {
                echo 'Testing..'
                sh 'npm run test'
            }
        }
        stage('Build') {
            steps {
                    script {
                        echo 'Building..'
                    }
            }
        }
        stage('Deploy') {
            steps {
                    script {
                        echo 'Deploying....'
                        sshagent(['ec2-server-key']) {
                            sh 'scp docker-compose.yaml ec2-user@3.64.228.132:/home/ec2-user'
                            sh 'docker compose up --detach'
                        }
                    }

            }
        }
    }
}