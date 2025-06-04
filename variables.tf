variable "aws_region" {
  description = "The AWS region to create resources in."
  type        = string
}

variable "cluster_name" {
  description = "The name of the EKS cluster."
  type        = string
}

variable "cluster_version" {
  description = "The Kubernetes version for the EKS cluster."
  type        = string
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
}

variable "public_subnet_cidrs" {
  description = "A list of CIDR blocks for the public subnets."
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "A list of CIDR blocks for the private subnets."
  type        = list(string)
}

variable "availability_zones" {
  description = "A list of availability zones for the subnets."
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