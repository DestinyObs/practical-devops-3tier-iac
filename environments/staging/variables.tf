# --- RDS ---
variable "db_name" {
  description = "The name of the database to create"
  type        = string
}

# Root-level variables for all modules

variable "aws_region" {
  description = "AWS region to deploy resources."
  type        = string
}

# --- VPC ---
variable "vpc_name" {
  description = "Name for the VPC"
  type        = string
}
variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}
variable "azs" {
  description = "List of availability zones"
  type        = list(string)
}
variable "public_subnet_cidrs" {
  description = "List of public subnet CIDRs"
  type        = list(string)
}
variable "private_subnet_cidrs" {
  description = "List of private subnet CIDRs"
  type        = list(string)
}

# --- ALB ---
variable "alb_name" {
  description = "Name for the ALB"
  type        = string
}
variable "internal" {
  description = "Whether the ALB is internal"
  type        = bool
}

# --- EC2/ASG ---
variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
}
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}
variable "key_name" {
  description = "Key pair name for SSH access"
  type        = string
}

# --- RDS ---
variable "rds_name" {
  description = "Name for the RDS instance"
  type        = string
}
variable "db_instance_class" {
  description = "RDS instance class"
  type        = string
}
variable "db_username" {
  description = "Username for the database"
  type        = string
}
variable "db_password" {
  description = "Password for the database"
  type        = string
  sensitive   = true
}

# --- ASG ---
variable "asg_name" {
  description = "Name for the Auto Scaling Group"
  type        = string
}
variable "launch_template_name" {
  description = "Name for the launch template"
  type        = string
}
variable "min_size" {
  description = "Minimum number of instances in ASG"
  type        = number
}
variable "max_size" {
  description = "Maximum number of instances in ASG"
  type        = number
}
variable "desired_capacity" {
  description = "Desired number of instances in ASG"
  type        = number
}
