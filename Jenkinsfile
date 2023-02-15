pipeline {
    agent any
    stages {
        stage('docker') {
            steps {
            echo "Before script" 
            sh '''sudo docker build -t docker.io/avl-task:v1 .
                sudo docker run -dit --name d1 -p 5000:5000 avl-task:v1 '''
            echo "after script"
            }
        }
    }
}