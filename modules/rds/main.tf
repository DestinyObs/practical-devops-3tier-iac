# RDS Security Group
resource "aws_security_group" "rds_sg" {
	name        = "${var.rds_name}-sg"
	description = "Allow DB access"
	vpc_id      = var.vpc_id

	ingress {
		from_port   = 5432
		to_port     = 5432
		protocol    = "tcp"
		cidr_blocks = ["10.0.0.0/8"] # Adjust as needed
	}

	egress {
		from_port   = 0
		to_port     = 0
		protocol    = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}

	tags = {
		Name = "${var.rds_name}-sg"
	}
}

# RDS Subnet Group
resource "aws_db_subnet_group" "this" {
	name       = "${var.rds_name}-subnet-group"
	subnet_ids = var.private_subnet_ids
	tags = {
		Name = "${var.rds_name}-subnet-group"
	}
}

# RDS Instance (PostgreSQL, Multi-AZ)
resource "aws_db_instance" "this" {
	identifier              = var.rds_name
	allocated_storage       = 20
	engine                  = "postgres"
	engine_version          = "15.3"
	instance_class          = var.db_instance_class
		# name                 = var.db_name # Removed due to engine compatibility error
	username                = var.db_username
	password                = var.db_password
	db_subnet_group_name    = aws_db_subnet_group.this.name
	vpc_security_group_ids  = [aws_security_group.rds_sg.id]
	multi_az                = true
	skip_final_snapshot     = true
	publicly_accessible     = false
	storage_encrypted       = true
	backup_retention_period = 7
	tags = {
		Name = var.rds_name
	}
}
