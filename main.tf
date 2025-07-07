module "vpc" {
  source                = "./modules/vpc"
  aws_region            = var.aws_region
  vpc_cidr_block        = var.vpc_cidr_block
  public_subnet_cidrs   = var.public_subnet_cidrs
  private_subnet_cidrs  = var.private_subnet_cidrs
  availability_zones    = var.availability_zones
  cluster_name          = var.cluster_name
}

module "eks" {
  source           = "./modules/eks"
  cluster_name     = var.cluster_name
  cluster_version  = var.cluster_version
  vpc_id           = module.vpc.vpc_id
  subnet_ids       = module.vpc.private_subnet_ids  # Use private subnets for the node group
  instance_types   = var.instance_types
  desired_size     = var.desired_size
  max_size         = var.max_size
  min_size         = var.min_size
  private_subnet_ids    = module.vpc.private_subnet_ids
  efs_security_group_id = module.vpc.efs_security_group_id
}