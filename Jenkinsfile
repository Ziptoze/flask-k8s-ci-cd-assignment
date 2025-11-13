pipeline {
    agent any

    environment {
        IMAGE_NAME = "flask-k8s-app"
        IMAGE_TAG = "latest"
        DEPLOYMENT_FILE = "kubernetes/deployment.yaml"
        SERVICE_FILE = "kubernetes/service.yaml"
    }

    stages {

        stage('Build Docker Image') {
            steps {
                script {
                    echo "🔨 Building Docker image..."
                    sh 'docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .'
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    echo "🚀 Deploying to Kubernetes..."
                    sh 'kubectl apply -f ${DEPLOYMENT_FILE}'
                    sh 'kubectl apply -f ${SERVICE_FILE}'
                }
            }
        }

        stage('Verify Deployment') {
            steps {
                script {
                    echo "🔍 Checking rollout status..."
                    sh 'kubectl rollout status deployment/flask-app-deployment'
                    echo "📦 Checking running pods and services..."
                    sh 'kubectl get pods'
                    sh 'kubectl get services'
                }
            }
        }
    }

    post {
        success {
            echo "✅ Pipeline completed successfully!"
        }
        failure {
            echo "❌ Pipeline failed. Please check logs."
        }
    }
}
