resource "aws_eks_node_group" "tubeplus-eks-nodegroup" {

    cluster_name = aws_eks_cluster.tubeplus-eks-cluster.name
    node_group_name = "tubeplus-eks-nodegroup"
    node_role_arn = aws_iam_role.tubeplus-eks_iam_nodes.arn
    subnet_ids = aws_subnet.tubeplus-public-subnet[*].id

    ami_type = "AL2_x86_64"
    capacity_type = "ON_DEMAND"
    instance_types = ["t3a.medium"]
    disk_size = 20

    scaling_config {
      # desired_size = 0
      # max_size = 1
      # min_size = 0
      desired_size = 2
      max_size = 3
      min_size = 1
    }

    depends_on = [
        aws_iam_role_policy_attachment.tubeplus-eks_iam_cluster_AmazonEKSWorkerNodePolicy,
        aws_iam_role_policy_attachment.tubeplus-eks_iam_cluster_AmazonEKS_CNI_Policy,
        aws_iam_role_policy_attachment.tubeplus-eks_iam_cluster_AmazonEC2ContainerRegistryReadOnly
    ]

    tags = {
      "Name" = "tubeplus-EKS-WORKER-NODES"
    }
}
