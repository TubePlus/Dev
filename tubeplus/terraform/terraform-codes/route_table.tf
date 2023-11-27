resource "aws_route_table" "tubeplus-route-table-pub-sub" {

  depends_on = [
    aws_vpc.tubeplus-vpc,
    aws_internet_gateway.tubeplus-internet-gateway
  ]

  vpc_id = aws_vpc.tubeplus-vpc.id

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.tubeplus-internet-gateway.id
  }

  tags = {
    Name = "tubeplus-route-table-pub-sub"
  }

}