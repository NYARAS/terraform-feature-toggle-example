module "web_servers" {
  source                 = "./module/nginx-webserver"
  instance_count         = var.instance_count
  load_balancing_enabled = var.load_balancing_enabled
}
