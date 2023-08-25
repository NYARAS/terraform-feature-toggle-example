locals {
  subnets = aws_subnet.nginx-webserver.*.id
  subnet_count       = 3
  availability_zones = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
}
