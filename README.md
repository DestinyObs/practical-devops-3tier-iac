
# Practical DevOps 3-Tier IaC

## Overview
This repository contains a complete, production-grade implementation of a resilient 3-tier architecture on AWS using Terraform. The infrastructure is modular, environment-driven, and designed for high availability, scalability, and security. It is suitable for modern containerized applications, where both frontend and backend services run as containers on the same EC2 instances, and a managed RDS instance provides the database tier.

## How This Infrastructure Meets the Project Requirements

**Objective:**  
Build a 3-tier architecture (frontend, backend, database) using Terraform, with a focus on resilience, modularity, and best practices.

**Key Learnings Addressed:**
- **VPC:** Custom, isolated network with public and private subnets across multiple Availability Zones.
- **Subnets:** Segregation of resources for security and high availability.
- **ALB:** Application Load Balancer for distributing incoming traffic to application servers.
- **EC2:** Auto Scaling Group of EC2 instances running both frontend and backend containers.
- **RDS:** Managed PostgreSQL database, deployed in private subnets with Multi-AZ for fault tolerance.
- **ASG:** Auto Scaling Group ensures scalability and resilience.
- **Multi-AZ Deployment:** All critical resources (subnets, RDS, ASG) are distributed across multiple Availability Zones for high availability.
- **Remote Backend:** Supports remote state management (S3 + DynamoDB) for team collaboration and state locking.
- **Security:** All sensitive values are excluded from version control. Security groups and key management follow best practices.

**Scenario:**  
Designed for an e-commerce company requiring always-available, fault-tolerant infrastructure. The architecture ensures zero single points of failure, supports scaling, and is ready for production workloads.

## AWS Resources Used

- VPC
- Public and Private Subnets (Multi-AZ)
- Internet Gateway
- NAT Gateways
- Route Tables and Associations
- Security Groups
- Elastic IPs
- Application Load Balancer (ALB)
- Target Groups
- Launch Template
- Auto Scaling Group (ASG)
- EC2 Instances (App Servers)
- RDS PostgreSQL Instance (Multi-AZ)
- RDS Subnet Group
- S3 Bucket (for remote state)
- DynamoDB Table (for state locking)
- Key Pair (for EC2 SSH access)

## Environments

- **Staging** and **Production** environments are fully separated, each with their own configuration, state, and secrets.
- All environment-specific values are managed via `terraform.tfvars` files.
- Remote state is supported for team collaboration and safety.

## Getting Started

### Prerequisites

- AWS account with sufficient permissions
- Terraform (v1.3+ recommended)
- AWS CLI configured or environment variables set for authentication

### Setup Steps

1. **Clone the repository**
   ```sh
   git clone https://github.com/destinyobs/practical-devops-3tier-iac.git
   cd practical-devops-3tier-iac/environments/staging
   ```

2. **Configure AWS credentials**
   - Use `aws configure` or set `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` as environment variables.

3. **Initialize Terraform**
   ```sh
   terraform init
   ```

4. **Review and update `terraform.tfvars`**
   - Set environment-specific values (VPC CIDRs, instance types, DB credentials, etc.).
   - Do not commit secrets or sensitive values.

5. **Plan and apply**
   ```sh
   terraform plan
   terraform apply
   ```

6. **Access Outputs**
   - After apply, Terraform will output all key resource endpoints and IDs.

### Remote State (Recommended for Teams)

- The project supports remote state via S3 and DynamoDB. Configure `backend.tf` in each environment as needed.

## Outputs

After a successful apply, the following outputs are provided:

- VPC ID
- Public and private subnet IDs
- ALB DNS name and ARN
- App server public and private IPs
- ASG name and ARN
- RDS endpoint and identifier
- Keypair PEM (sensitive, for SSH access)

## Security

- No secrets or sensitive values are committed to version control.
- All `.tfvars` and key files are gitignored by default.
- SSH keys are generated per environment and should be secured after apply.
- Security groups are tightly scoped to minimize exposure.

## Cost Estimation

To estimate costs, include all the AWS resources listed above in the [AWS Pricing Calculator](https://calculator.aws.amazon.com/). Adjust quantities (e.g., number of EC2 instances, NAT gateways, RDS instance size, data transfer) as per your environment and expected load.

## References

- [Terraform AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [AWS Pricing Calculator](https://calculator.aws.amazon.com/)
- [Project Scenario Reference](https://github.com/atenadadkhah/reader)

## License

This project is provided for educational and demonstration purposes. Use at your own risk.
