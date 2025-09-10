# EC2 Security Group

resource "aws_security_group" "ec2_sg" {
	name        = "${var.ec2_name}-sg"
	description = "Allow HTTP, HTTPS, and SSH"
	vpc_id      = var.vpc_id

	ingress {
		from_port   = 22
		to_port     = 22
		protocol    = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}
	ingress {
		from_port   = 80
		to_port     = 80
		protocol    = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}
	ingress {
		from_port   = 443
		to_port     = 443
		protocol    = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}
	egress {
		from_port   = 0
		to_port     = 0
		protocol    = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}
	tags = {
		Name = "${var.ec2_name}-sg"
	}

}

# EC2 Instance
resource "aws_instance" "this" {
	ami                    = var.ami_id
	instance_type          = var.instance_type
	subnet_id              = var.subnet_id
	vpc_security_group_ids = concat([aws_security_group.ec2_sg.id], var.security_group_ids)
	key_name               = var.key_name != "" ? var.key_name : null
	associate_public_ip_address = true
	tags = {
		Name = var.ec2_name
	}
}
