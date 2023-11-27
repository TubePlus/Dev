resource "aws_eks_cluster" "tubeplus-eks-cluster" {

  depends_on = [
    aws_iam_role_policy_attachment.tubeplus-iam-policy-eks-cluster,
    aws_iam_role_policy_attachment.tubeplus-iam-policy-eks-cluster-vpc,
  ] # iam_role을 설치하고 진행해야 한다. -> cluster, node 의 role 미리 설정할 것

  name     = var.cluster_name
  role_arn = aws_iam_role.tubeplus-iam-role-eks-cluster.arn # role을 참조하도록 (resource의 고유한 name)
  version = "1.28"

  enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
  #  eks cluster의 controll plan에서 log를 보기 위한 (cluster watch를 통해 볼것 설정)

  vpc_config {
    security_group_ids = [aws_security_group.tubeplus-sg-eks-cluster.id] # security group data
    subnet_ids         = ["subnet-003587092cbcd387a","subnet-079c2f7a611293138"] # eks cluster subenet ids
    endpoint_public_access = true #  인터넷망에서 pulbic access 허가 여부
  }
}
