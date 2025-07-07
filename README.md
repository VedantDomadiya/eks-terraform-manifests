# 🚀 EKS Landing Zone: A Complete IaC & CI/CD Project

[![Terraform](https://img.shields.io/badge/IaC-Terraform-623CE4?logo=terraform\&logoColor=white)](https://www.terraform.io/)
[![CI/CD](https://img.shields.io/github/actions/workflow/status/vedantdomadiya/eks-terraform-manifests/deploy.yml?label=CI/CD\&logo=githubactions)](https://github.com/vedantdomadiya/eks-terraform-manifests/actions)
[![License](https://img.shields.io/github/license/vedantdomadiya/eks-terraform-manifests)](LICENSE)

---

## 📚 Table of Contents

* [Overview](#overview)
* [✨ Key Features](#-key-features)
* [🛠️ Technology Stack](#️-technology-stack)
* [📋 Prerequisites](#-prerequisites)
* [🚀 How to Recreate This Project](#-how-to-recreate-this-project)

  * [Phase 1: Environment Setup](#phase-1-environment-setup)
  * [Phase 2: Configure Your Deployment](#phase-2-configure-your-deployment)
  * [Phase 3: Deploy the Core Infrastructure](#phase-3-deploy-the-core-infrastructure)
  * [Phase 4: Connect to Your Cluster](#phase-4-connect-to-your-cluster)
  * [Phase 5: Deploy the Add-ons and Workloads](#phase-5-deploy-the-add-ons-and-workloads)
* [🔥 Learnings & Benefits](#-learnings--benefits)
* [🧹 Cleaning Up](#-cleaning-up)

---

## 🧭 Overview

This repository contains a complete, **production-grade AWS EKS (Elastic Kubernetes Service)** cluster setup, provisioned entirely with **Terraform** and deployed automatically via **GitHub Actions**.

It is an end-to-end learning project ideal for those new to **Kubernetes**, **AWS**, and **Infrastructure as Code (IaC)**. You won’t just build a cluster—you’ll build a **cloud-native ecosystem**, including:

* Advanced networking
* Auto-scaling infrastructure
* Persistent storage
* Modular CI/CD workflows

---

## ✨ Key Features

### Infrastructure as Code (IaC)

* Fully declarative AWS provisioning using **Terraform**
* Clean, **modular code structure**

### CI/CD for Infrastructure

* Automated deployments with **GitHub Actions**
* Push to `main` branch = infrastructure update

### Scalable & Resilient

* **Horizontal Pod Autoscaler (HPA)** for application scaling
* **Karpenter** for real-time, cost-efficient EC2 autoscaling

### Advanced Networking

* Custom, **isolated VPC**
* **AWS Load Balancer Controller** for ALB ingress
* **Kubernetes NetworkPolicies** for secure pod communication

### Persistent Storage

* Shared persistent storage with **Amazon EFS**
* Dynamic volume provisioning via **EFS CSI Driver**

### Secure & Modular

* Configuration and logic are split across **two repos**
* Fine-grained permissions with **IAM Roles for Service Accounts (IRSA)**

---

## 🛠️ Technology Stack

* **AWS**: EKS, VPC, IAM, EFS, ALB
* **Terraform**: Infrastructure as Code
* **GitHub Actions**: CI/CD pipeline
* **Kubernetes**: Core orchestration
* **Karpenter**: Intelligent node autoscaler
* **Helm**: Kubernetes package management
* **kubectl, eksctl**: Cluster management tools

---

## 📋 Prerequisites

Ensure the following are installed/configured:

* ✅ An **AWS account** with billing and admin-level permissions
* ✅ A **GitHub account**
* ✅ **Terraform CLI**
* ✅ **AWS CLI** (run `aws configure`)
* ✅ **kubectl**
* ✅ **helm**
* ✅ **eksctl**

---

## 🚀 How to Recreate This Project

### Phase 1: Environment Setup

Clone the repositories:

```bash
# Clone infrastructure repo
git clone https://github.com/<your-username>/eks-terraform-manifests.git

# Clone config repo
git clone https://github.com/<your-username>/eks-config.git
```

Set GitHub secrets in the `eks-terraform-manifests` repository:

* `AWS_ACCESS_KEY_ID`
* `AWS_SECRET_ACCESS_KEY`
* `GH_PAT` (GitHub personal access token with `repo` scope)

---

### Phase 2: Configure Your Deployment

Edit the variables:

```bash
# In eks-config/terraform.tfvars
region        = "us-east-1"
cluster_name  = "my-eks-cluster"
node_type     = "t3.medium"
```

Commit & push changes:

```bash
cd eks-config
git add .
git commit -m "Update deployment config"
git push origin main
```

---

### Phase 3: Deploy the Core Infrastructure

Push your Terraform code to trigger CI/CD:

```bash
cd eks-terraform-manifests
git push origin main
```

Check the GitHub Actions tab to monitor the progress. Provisioning takes \~15-20 minutes.

---

### Phase 4: Connect to Your Cluster

Update `kubeconfig`:

```bash
aws eks update-kubeconfig --name <your-cluster-name> --region <your-aws-region>
```

Verify cluster access:

```bash
kubectl get nodes
```

---

### Phase 5: Deploy the Add-ons and Workloads

#### Install Ingress Controller

Get IAM Role ARN from Terraform output:

```bash
terraform output lbc_controller_role_arn
```

Install ALB Ingress Controller with Helm (customize accordingly).

#### Deploy a Sample App

```bash
kubectl apply -f game-2048.yaml
kubectl apply -f game-ingress.yaml
```

Find the Ingress URL:

```bash
kubectl get ingress
```

Open the DNS address in your browser 🎉

---

## 🔥 Learnings & Benefits

This project covers critical DevOps concepts:

* ✅ **IaC-first** deployments with Terraform
* ✅ GitOps-style **CI/CD**
* ✅ Real-world **auto-scaling** (apps + nodes)
* ✅ Secure, scalable **networking**
* ✅ Stateful apps via **EFS** + CSI Driver
* ✅ Deep exposure to **AWS IAM, VPC, Kubernetes policies**

---

## 🧹 Cleaning Up

To destroy all AWS resources and avoid charges:

1. Go to **Actions** in your GitHub repo
2. Select **Terraform EKS Destroy** workflow
3. Click **Run workflow**

> 💡 Always double-check that resources are destroyed in the AWS Console!

---

## 📄 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

