resource "aws_eks_node_group" "tubeplus-eks-nodegroup" {
  cluster_name    = aws_eks_cluster.tubeplus-eks-cluster.name
  node_group_name = "tubeplus-eks-nodegroup"
  node_role_arn   = aws_iam_role.tubeplus-iam-role-eks-nodegroup.arn
  subnet_ids      = ["subnet-003587092cbcd387a","subnet-079c2f7a611293138"]
  instance_types = ["t3a.medium"]
  disk_size = 20

  labels = {
    "role" = "eks-nodegroup"
  }

  scaling_config {
    desired_size = 2 # worker node 수량
    min_size     = 1 # 최소 수량
    max_size     = 3 # 최대 수량
  } # eks node group의 scale config

  depends_on = [
    aws_iam_role_policy_attachment.tubeplus-iam-policy-eks-nodegroup,
    aws_iam_role_policy_attachment.tubeplus-iam-policy-eks-nodegroup-cni,
    aws_iam_role_policy_attachment.tubeplus-iam-policy-eks-nodegroup-ecr,
  ]

  tags = {
    "Name" = "${aws_eks_cluster.tubeplus-eks-cluster.name}-worker-node"
  }
}