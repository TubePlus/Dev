resource "aws_subnet" "tubeplus-public-subnet" {

  depends_on = [
    aws_vpc.tubeplus-vpc
  ]

  count = length(var.aws_vpc_public_subnets)
  vpc_id = aws_vpc.tubeplus-vpc.id
  cidr_block = var.aws_vpc_public_subnets[count.index]
  availability_zone = var.aws_azs[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name                                     = "tubeplus-public-subnet${count.index+1}"
    "kubernetes.io/cluster/tubeplus-eks-cluster" = "shared"
    "kubernetes.io/role/elb"                 = 1
  }

}