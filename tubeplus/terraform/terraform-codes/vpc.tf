resource "aws_vpc" "tubeplus-vpc" {

  cidr_block                       = var.aws_vpc_cidr_block
  enable_dns_hostnames             = "true"
  enable_dns_support               = "true"

  tags = {
    Name = "tubeplus-vpc"
  }

}
