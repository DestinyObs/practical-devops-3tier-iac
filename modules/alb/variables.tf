variable "vpc_id" {
  description = "VPC ID for the ALB"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs for the ALB"
  type        = list(string)
}

variable "alb_name" {
  description = "Name for the ALB"
  type        = string
  default     = "practical-devops-alb"
}

variable "internal" {
  description = "Whether the ALB is internal"
  type        = bool
  default     = false
}
