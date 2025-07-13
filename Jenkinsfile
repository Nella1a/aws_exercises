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
                        def ec2Instance = 'ec2-user@63.178.218.243 '
                        def startContainers = 'docker-compose up --detach'
                        sshagent(['ec2-ssh-key-exercise']) {
                            sh '''
                                mkdir -p ~/.ssh
                                ssh-keyscan -H 63.178.218.243 >> ~/.ssh/known_hosts
                            '''
                            sh "scp docker-compose.yaml ${ec2Instance}:/home/ec2-user"
                            sh "ssh -o StrictHostKeyChecking=no ${ec2Instance} ${startContainers}"
                        }
                    }

            }
        }
    }
}