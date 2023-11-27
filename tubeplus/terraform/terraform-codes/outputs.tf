output "cluster_name" {
  value = aws_eks_cluster.tubeplus-eks-cluster.name
}

output "cluster_endpoint" {
  value = aws_eks_cluster.tubeplus-eks-cluster.endpoint
}