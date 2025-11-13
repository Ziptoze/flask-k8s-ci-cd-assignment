# Flask-K8s CI/CD Pipeline Assignment

## Project Overview
This project demonstrates an **end-to-end Continuous Integration and Continuous Delivery (CI/CD) pipeline** for a Python Flask application deployed on **Kubernetes** using **Minikube**. The goal is to simulate a real-world software development workflow using industry-standard tools including **GitHub Actions**, **Jenkins**, **Docker**, and **Kubernetes**.  

The CI/CD pipeline automates the following steps:  
1. Preprocessing and linting of code using **GitHub Actions**.  
2. Docker image build of the Flask application.  
3. Deployment to a local Kubernetes cluster (Minikube) using **Jenkins**.  
4. Verification of successful deployment and rollout.  
5. Demonstration of scaling, rolling updates, and load balancing.

This project is structured to illustrate industry-standard DevOps practices, including **automated testing, containerization, continuous deployment, and infrastructure as code**.

---

## Kubernetes Features Used
The Kubernetes configuration for this project demonstrates the following core features:

- **Deployment**: The Flask application is deployed as a Kubernetes Deployment object, allowing multiple replicas for high availability.  
- **Rolling Update Strategy**: Updates pods incrementally to avoid downtime using `maxSurge` and `maxUnavailable` parameters.  
- **Scaling**: Supports manual scaling of replicas using `kubectl scale` to demonstrate load distribution.  
- **Service (NodePort)**: Exposes the Flask application to external clients, allowing access via a NodePort on the host machine.  
- **Resource Requests and Limits**: CPU and memory limits are defined for each pod to ensure fair usage of cluster resources.  
- **Self-Healing**: Kubernetes automatically restarts pods in case of failure, ensuring application availability.  

---

## Prerequisites
Before running this project, ensure you have the following installed on your machine:

- **Docker Desktop**  
- **Minikube**  
- **kubectl**  
- **Jenkins**  
- **Git**  
- **Python 3.8+**  

---

## Build and Run Locally Using Docker

To test the Flask application locally without Kubernetes:

1. **Clone the repository**
```bash
git clone https://github.com/<your-username>/flask-k8s-ci-cd-assignment.git
cd flask-k8s-ci-cd-assignment


Build the Docker image

docker build -t flask-k8s-app:latest .


Run the Docker container

docker run -p 5000:5000 flask-k8s-app:latest


Open the application in your browser

http://localhost:5000


You should see the Flask app responding with "Hello, World!" or your custom message.

Deploy to Kubernetes Using Jenkins

The CI/CD pipeline is configured to automatically deploy the application to Kubernetes whenever changes are merged into the main branch.

Steps:

Start Minikube

minikube start --driver=docker


Ensure Kubernetes cluster is ready

kubectl get nodes


Merge changes to main branch

GitHub Actions will run tests and build the Docker image.

Jenkins will pick up the changes via webhook or manual trigger.

Jenkins Pipeline Stages

Stage 1: Build Docker Image – Jenkins builds the image using the Dockerfile.

Stage 2: Deploy to Kubernetes – Jenkins applies the deployment.yaml and service.yaml manifests using kubectl.

Stage 3: Verify Deployment – Jenkins checks rollout status and prints pods and services to the console.

Access the deployed application

minikube service flask-app-service


You will see your Flask app running inside the Kubernetes cluster.

Automated Rollouts, Scaling, and Load Balancing

The Kubernetes setup ensures high availability and resilience of the application:

Rolling Updates:
Updates are applied one pod at a time, minimizing downtime.

kubectl rollout status deployment flask-app-deployment


Scaling:
You can scale the deployment manually or automatically based on load:

kubectl scale deployment flask-app-deployment --replicas=5


Load Balancing:
The NodePort Service ensures incoming traffic is distributed across all available pods, providing a simple load-balancing mechanism.

Self-Healing:
Kubernetes monitors the pods and automatically restarts any failed pod to maintain the desired number of replicas.

Project Structure
flask-k8s-ci-cd-assignment/
│
├── app.py                  # Basic Flask application
├── requirements.txt        # Python dependencies
├── Dockerfile              # Docker image definition
├── kubernetes/
│   ├── deployment.yaml     # Kubernetes Deployment manifest
│   └── service.yaml        # Kubernetes Service manifest
├── Jenkinsfile             # Jenkins declarative pipeline
└── .github/
    └── workflows/
        └── ci.yml          # GitHub Actions workflow

Author

Developer: Rameen Elahi

Admin Abdul Rehman