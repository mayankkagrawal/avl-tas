pipeline {
    agent any
    stages {
        stage('clone') {
            steps {
            echo "Before script" 
            git branch: 'main', url: 'https://github.com/ipbharaj/flask-calculator.git'
            echo "after script"
            }
        }
        stage('docker') {
            steps {
            echo "Before script" 
            sh '''ls -la'''
            sh '''sudo docker build -t docker.io/avl-task:v1 .
                sudo docker run -dit --name d1 -p 5000:5000 avl-task:v1 '''
            echo "after script"
            }
        }
    }
}