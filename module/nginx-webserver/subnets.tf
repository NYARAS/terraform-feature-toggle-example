resource "aws_subnet" "nginx-webserver" {
  count                   = local.subnet_count
  vpc_id                  = aws_vpc.nginx-webserver.id
  availability_zone       = element(local.availability_zones, count.index)
  cidr_block              = "10.0.${local.subnet_count * (var.infrastructure_version - 1) + count.index + 1}.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "${element(local.availability_zones, count.index)} (v${var.infrastructure_version})"
  }
}
