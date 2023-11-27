resource "aws_internet_gateway" "tubeplus-internet-gateway" {

  depends_on = [
    aws_vpc.tubeplus-vpc
  ]

  vpc_id = aws_vpc.tubeplus-vpc.id

  tags = {
    Name = "tubeplus-internet-gateway"
  }
}
