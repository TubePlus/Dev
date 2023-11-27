resource "aws_route_table_association" "tubeplus-route-association-pub-sub" {

    count = length(var.aws_vpc_public_subnets)
    subnet_id = aws_subnet.tubeplus-public-subnet[count.index].id
    route_table_id = aws_route_table.tubeplus-route-table-pub-sub.id
    
}
