variable "instance_count" {
  type        = number
  default     = 1
  description = "Number of nginx webservers to create"
}

variable "load_balancing_enabled" {
  type        = bool
  default     = false
  description = "Add load balancer or not"
}
