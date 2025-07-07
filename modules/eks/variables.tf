variable "cluster_name" {
  description = "The name of the EKS cluster."
  type        = string
}

variable "cluster_version" {
  description = "The Kubernetes version for the EKS cluster."
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC where the cluster will be created."
  type        = string
}

variable "subnet_ids" {
  description = "A list of subnet IDs for the EKS cluster."
  type        = list(string)
}

variable "instance_types" {
  description = "The EC2 instance types for the worker nodes."
  type        = list(string)
}

variable "desired_size" {
  description = "The desired number of worker nodes."
  type        = number
}

variable "max_size" {
  description = "The maximum number of worker nodes."
  type        = number
}

variable "min_size" {
  description = "The minimum number of worker nodes."
  type        = number
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for EFS mount targets."
  type        = list(string)
}

variable "efs_security_group_id" {
  description = "The ID of the security group for EFS traffic."
  type        = string
}