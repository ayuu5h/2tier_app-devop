pipeline {
    agent any
    stages {
        stage('Create_Infra') {
            steps {
                script {
                    // Checkout the code
                    checkout scm

                    // Initialize Terraform
                    sh 'terraform -chdir=terraform init'

                    // Apply Terraform configurations
                    sh 'terraform -chdir=terraform apply -auto-approve'
                }
            }
        }
        stage('Deploy_Apps') {
            steps {
                script {
                    // Execute frontend script
                    sh 'ssh -o StrictHostKeyChecking=no -i ~/.ssh/id_rsa ec2-user@$(terraform -chdir=terraform output -raw frontend_ip) "bash /tmp/frontend.sh"'

                    // Execute backend script
                    sh 'ssh -o StrictHostKeyChecking=no -i ~/.ssh/id_rsa ec2-user@$(terraform -chdir=terraform output -raw backend_private_ip) "bash /tmp/backend.sh"'
                }
            }
        }
        stage('Test_Solution') {
            steps {
                script {
                    // Get frontend DNS
                    def frontend_dns = sh(script: 'terraform -chdir=terraform output -raw frontend_dns', returnStdout: true).trim()
                    echo "Frontend DNS: ${frontend_dns}"

                    // Test the frontend application
                    sh "curl http://${frontend_dns}"
                }
            }
        }
    }
} 
