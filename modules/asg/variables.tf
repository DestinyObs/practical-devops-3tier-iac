variable "asg_name" {
  description = "Name for the Auto Scaling Group"
  type        = string
  default     = "practical-devops-asg"
}

variable "launch_template_name" {
  description = "Name for the launch template"
  type        = string
  default     = "practical-devops-lt"
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "subnet_ids" {
  description = "List of subnet IDs for the ASG"
  type        = list(string)
}

variable "security_group_ids" {
  description = "List of security group IDs for the ASG EC2 instances"
  type        = list(string)
}

variable "key_name" {
  description = "Key pair name for SSH access"
  type        = string
  default     = ""
}

variable "min_size" {
  description = "Minimum number of instances"
  type        = number
  default     = 2
}

variable "max_size" {
  description = "Maximum number of instances"
  type        = number
  default     = 4
}

variable "desired_capacity" {
  description = "Desired number of instances"
  type        = number
  default     = 2
}
