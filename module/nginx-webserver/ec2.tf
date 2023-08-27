resource "aws_instance" "nginx-webserver" {
  ami                    = data.aws_ami.amzlinux.id
  instance_type          = var.instance_type
  subnet_id              = local.subnets
  vpc_security_group_ids = [aws_security_group.nginx-webserver.id]

   user_data = templatefile("./nginx-script.sh", {
    file_content = "Nginx Webserver"
  })

  tags = {
    Name                  = "nginx-webserver (v${var.infrastructure_version})"
    InfrastructureVersion = var.infrastructure_version
  }
}
