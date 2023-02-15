pipeline {
    agent any
    parameters {
        string(name: 'FLASK', defaultValue: 'subdir1', description: 'Directory where you want to clone the flask repo')
        string(name: 'TASK', defaultValue: 'subdir2', description: 'Directory where you want to clone the task repo')
        string(name: 'NAME', defaultValue: 'doc1', description: 'Name of the docker container')
        string(name: 'IMAGE', defaultValue: 'avl-task:v1', description: 'Image of the docker container')
        string(name: 'USERNAME', defaultValue: 'devil00', description: 'Username of the dockerhub')
    }
    stages {
        stage('clone') {
            steps {
            checkout scmGit(branches: [[name: '*/main']], extensions: [[$class: 'RelativeTargetDirectory', relativeTargetDir: "${params.FLASK}"]], userRemoteConfigs: [[url: 'https://github.com/ipbharaj/flask-calculator.git']])
            }
        }
        stage('docker-build') {
            environment {     
            DOCKERHUB_CREDENTIALS= credentials('dockerlogin')     
            } 
            steps {
            script{
                env.FLASK = "${FLASK}"
            }
            checkout scmGit(branches: [[name: '*/main']], extensions: [[$class: 'RelativeTargetDirectory', relativeTargetDir: "${params.TASK}"]], userRemoteConfigs: [[credentialsId: 'new-id', url: 'https://github.com/mayankkagrawal/avl-task.git']])
            sh "sed  -e 's/FLASK/${FLASK}/g' Dockerfile.tpl > Dockerfile"
            sh "docker build -t docker.io/'${params.IMAGE}' ."
            sh "docker tag docker.io/'${params.IMAGE}' docker.io/'${params.USERNAME}'/'${params.IMAGE}'"
            sh "echo $DOCKERHUB_CREDENTIALS | sudo docker login -u '${params.USERNAME}' --password-stdin"        
            sh "docker push docker.io/'${params.USERNAME}'/'${params.IMAGE}'"
            }
        }
        stage('docker-run') {
            steps {
            sh  "docker run -dit --name '${params.NAME}' -p 5000:5000 '${params.IMAGE}'"
            }
        }
        stage('helm') {
            steps {
            sh "gcloud container clusters get-credentials new-cluster --zone asia-south1-a --project test-env-project-373606 --internal-ip"
            sh  "helm install new-app app/ --values app/values.yaml"
            }
        }
    }
}
