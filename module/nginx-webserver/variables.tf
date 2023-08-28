variable "aws_region" {
  description = "Region in which AWS resources to be created"
  type        = string
  default     = "eu-west-1"
}

variable "ec2_ami_id" {
  description = "AMI ID"
  type        = string
  default     = "ami-04dd4500af104442f" # Amazon Linus 2 AMI ID
}

variable "ec2_instance_count" {
  description = "EC2 Instance Count"
  type        = number
  default     = 1
}

variable "security_group_name" {
  description = "Name security group to be created"
  type = string
  default = "test"
}

variable "infrastructure_version" {
    description = "Version of the infrastructure currently running"
  default = "1"
}

variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
  default     = "t2.micro"
}

variable "instance_count" {
  type        = number
  default     = 1
  description = "Number of nginx webservers instances"
}

variable "load_balancing_enabled" {
  type        = bool
  default     = false
  description = "Add load balancer or not"
}
