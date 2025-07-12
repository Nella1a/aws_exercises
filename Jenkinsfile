#! /usr/bin/env groovy

pipeline {
    agent any

    stages {
        stage('Test') {
            steps {
                script {
                    echo 'Testing..'
                    dir("app") {
                        sh 'npm install'
                        sh 'npm run test'
                    }
                }
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
                        def ec2Instance = 'ec2-user@3.64.228.132'
                        def startContainers = 'docker-compose up --detach'
                        sshagent(['ec2-ssh-key-exercise']) {
                            sh '''
                                mkdir -p ~/.ssh
                                ssh-keyscan -H 3.64.228.132 >> ~/.ssh/known_hosts
                            '''
                            sh "scp docker-compose.yaml ${ec2Instance}:/home/ec2-user"
                            sh "ssh -o StrictHostKeyChecking=no ${ec2Instance} ${startContainers}"
                        }
                    }

            }
        }
    }
}