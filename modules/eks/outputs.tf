output "cluster_name" {
  description = "The name of the EKS cluster."
  value       = aws_eks_cluster.main.name
}

output "cluster_endpoint" {
  description = "The endpoint for the EKS cluster."
  value       = aws_eks_cluster.main.endpoint
}

output "cluster_ca_certificate" {
  description = "The CA certificate for the EKS cluster."
  value       = aws_eks_cluster.main.certificate_authority[0].data
}

output "cluster_autoscaler_role_arn" {
  description = "ARN of the IAM role for the Cluster Autoscaler."
  value       = aws_iam_role.cluster_autoscaler.arn
}

output "karpenter_node_role_arn" {
  description = "ARN of the IAM role for nodes launched by Karpenter."
  value       = aws_iam_role.karpenter_node.arn
}

output "karpenter_controller_role_arn" {
  description = "ARN of the IAM role for the Karpenter controller."
  value       = aws_iam_role.karpenter_controller.arn
}

output "lbc_controller_role_arn" {
  description = "ARN of the IAM role for the AWS Load Balancer Controller."
  value       = aws_iam_role.lbc_controller.arn
}

output "ebs_csi_controller_role_arn" {
  description = "ARN of the IAM role for the EBS CSI Driver."
  value       = aws_iam_role.ebs_csi_controller.arn
}