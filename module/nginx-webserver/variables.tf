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

variable "security_groups_map" {
  description = "A map of security groups to be created"
  type = map
  default = {
      test = "test"
  }
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
