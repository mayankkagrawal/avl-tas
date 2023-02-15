pipeline {
    agent any
    // parameters {
    //     string(name: 'FLASK', defaultValue: '/subdir1', description: 'Enter a directroy name where you want to copy flask repo')
    //     string(name: 'TASK', defaultValue: '/subdir2', description: 'Enter a directroy name where you want to copy task repo')
    // }
    stages {
        stage('clone') {
            steps {
            checkout scmGit(branches: [[name: '*/main']], extensions: [[$class: 'RelativeTargetDirectory', relativeTargetDir: '/subdir1']], userRemoteConfigs: [[url: 'https://github.com/ipbharaj/flask-calculator.git']])
            }
        }
        stage('docker') {
            steps {
            echo "Before script" 
            checkout scmGit(branches: [[name: '*/main']], extensions: [[$class: 'RelativeTargetDirectory', relativeTargetDir: '/subdir2']], userRemoteConfigs: [[credentialsId: 'new-id', url: 'https://github.com/mayankkagrawal/avl-task.git']])
            sh '''ls -la'''
            sh '''pwd'''
            sh '''sudo docker build -t docker.io/avl-task:v1 .
                sudo docker run -dit --name d1 -p 5000:5000 avl-task:v1 '''
            echo "after script"
            }
        }
    }
}