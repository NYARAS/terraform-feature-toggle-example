output "ec2_ips" {
  value = aws_instance.nginx-webserver.*.public_ip

}

output "load_balancer_ip" {
  value = var.load_balancing_enabled ? aws_lb.nginx-webserver.0.dns_name : ""
}
