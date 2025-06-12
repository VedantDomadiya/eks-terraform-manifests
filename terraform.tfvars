# AWS Settings
aws_region = "ap-south-1"

# EKS Cluster Settings
cluster_name    = "my-eks-cluster"
cluster_version = "1.32"

# VPC Network Configuration
vpc_cidr_block = "10.0.0.0/16"
availability_zones = ["ap-south-1a", "ap-south-1b"]
public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]

# EKS Node Group Settings
instance_types = ["t2.micro"] 
desired_size   = 2
min_size       = 1
max_size       = 2