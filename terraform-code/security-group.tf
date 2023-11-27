# 보안그룹 설정

resource "aws_security_group" "tubeplus-sg-eks-cluster" {
  name        = "tubeplus-sg-eks-cluster"
  description = "security_group for tubeplus-eks-cluster"
  vpc_id      = "vpc-081527283ccc03830"

  tags = {
    Name = "tubeplus-sg-eks-cluster"
  }
}

resource "aws_security_group_rule" "tubeplus-sg-eks-cluster-ingress" {

  security_group_id = aws_security_group.tubeplus-sg-eks-cluster.id
  type              = "ingress"
  description       = "ingress security_group_rule for tubeplus-eks-cluster"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
} # 모든 인 바운드

resource "aws_security_group_rule" "tubeplus-sg-eks-cluster-egress" {

  security_group_id = aws_security_group.tubeplus-sg-eks-cluster.id
  type              = "egress"
  description       = "egress security_group_rule for tubeplus-eks-cluster"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
} # 모든 아웃 바운드