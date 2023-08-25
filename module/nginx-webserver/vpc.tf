resource "aws_vpc" "nginx-webserver" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  enable_classiclink   = false
  instance_tenancy     = "default"
  tags = {
    Name = "Webserver Deployment (v${var.infrastructure_version})"
  }
}
