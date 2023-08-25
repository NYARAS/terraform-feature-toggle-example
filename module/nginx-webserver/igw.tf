resource "aws_internet_gateway" "nginx-webserver" {
  vpc_id = aws_vpc.nginx-webserver.id
  tags = {
    Name = "Webserver Deployment (v${var.infrastructure_version})"
  }
}
