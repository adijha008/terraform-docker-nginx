pipeline {
  agent { label 'windows' }
  options { timestamps() }
  environment {
    TF_IN_AUTOMATION = 'true'
    TF_INPUT = 'false'
  }
  stages {
    stage('Checkout') {
      steps { checkout scm }
    }
    stage('Terraform Init') {
      steps { powershell 'terraform init' }
    }
    stage('Validate') {
      steps { powershell 'terraform validate' }
    }
    stage('Plan') {
      steps { powershell 'terraform plan -out=tfplan' }
      post { success { archiveArtifacts artifacts: 'tfplan', fingerprint: true } }
    }
    stage('Approve?') {
      steps { script { input message: "Apply Terraform changes?", ok: 'Apply' } }
    }
    stage('Apply') {
      steps { powershell 'terraform apply -auto-approve tfplan' }
    }
    stage('Show Output') {
      steps { powershell 'terraform output' }
    }
  }
}