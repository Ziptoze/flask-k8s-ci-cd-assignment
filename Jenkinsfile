pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t flask-app .'
            }
        }
        stage('Test') {
            steps {
                echo 'Running basic tests...'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deployment stage (to be implemented in Task 4)'
            }
        }
    }
}
