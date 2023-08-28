resource "aws_instance" "nginx-webserver" {
    count                  = var.ec2_instance_count
  ami                    = data.aws_ami.amzlinux.id
  instance_type          = var.instance_type
  subnet_id              = element(local.subnets, count.index)
  vpc_security_group_ids = [aws_security_group.nginx-webserver.id]

   user_data = templatefile("./module/nginx-webserver/nginx-script.sh", {
    file_content = "Nginx Webserver"
  })

  tags = {
    Name                  = "nginx-webserver (v${var.infrastructure_version})"
    InfrastructureVersion = var.infrastructure_version
  }
}
