variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}


variable "subnet_id" {
  description = "Subnet ID for the EC2 instance"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for the EC2 security group"
  type        = string
}

variable "security_group_ids" {
  description = "List of security group IDs for the EC2 instance"
  type        = list(string)
}

variable "key_name" {
  description = "Key pair name for SSH access"
  type        = string
  default     = ""
}

variable "ec2_name" {
  description = "Name for the EC2 instance"
  type        = string
  default     = "practical-devops-ec2"
}
