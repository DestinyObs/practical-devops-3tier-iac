# Staging environment outputs


# 3-Tier App Outputs (App server runs both FE/BE as containers)
output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "ID of the VPC for the 3-tier architecture"
}

output "public_subnet_ids" {
  value       = module.vpc.public_subnet_ids
  description = "IDs of the public subnets in the VPC"
}

output "private_subnet_ids" {
  value       = module.vpc.private_subnet_ids
  description = "IDs of the private subnets in the VPC"
}

output "alb_dns_name" {
  value       = module.alb.alb_dns_name
  description = "DNS name of the Application Load Balancer (entrypoint for the app)"
}

output "alb_arn" {
  value       = module.alb.alb_arn
  description = "ARN of the Application Load Balancer"
}

output "app_server_public_ip" {
  value       = module.ec2.public_ip
  description = "Public IP of the EC2 instance running FE/BE containers (app server)"
}

output "app_server_private_ip" {
  value       = module.ec2.private_ip
  description = "Private IP of the EC2 instance running FE/BE containers (app server)"
}

output "asg_name" {
  value       = module.asg.asg_name
  description = "Name of the Auto Scaling Group for the app server"
}

output "asg_arn" {
  value       = module.asg.asg_arn
  description = "ARN of the Auto Scaling Group for the app server"
}

output "rds_endpoint" {
  value       = module.rds.rds_endpoint
  description = "Endpoint of the RDS PostgreSQL instance (database tier)"
}

output "rds_identifier" {
  value       = module.rds.rds_identifier
  description = "Identifier of the RDS PostgreSQL instance"
}

output "keypair_private_key_pem" {
  value       = module.keypair.private_key_pem
  sensitive   = true
  description = "PEM-encoded private key for SSH (save as .pem and secure it!)"
}
