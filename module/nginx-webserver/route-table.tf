resource "aws_route_table" "nginx-webserver" {
  vpc_id = aws_vpc.nginx-webserver.id

  route {
    //associated subnet can reach everywhere
    cidr_block = "0.0.0.0/0"
    //CRT uses this IGW to reach internet
    gateway_id = aws_internet_gateway.nginx-webserver.id
  }

  tags = {
    Name = "Webserver Deployment (v${var.infrastructure_version})"
  }
}

resource "aws_route_table_association" "nginx-webserver" {
  count          = 3
  subnet_id      = element(local.subnets, count.index)
  route_table_id = aws_route_table.nginx-webserver.id
}
