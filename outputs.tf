output "ec2_ips" {
  value = module.web_servers.ec2_ips
}

output "load_balancer_ip" {
  value = module.web_servers.load_balancer_ip
}
