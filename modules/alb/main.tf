# ALB Security Group
resource "aws_security_group" "alb_sg" {
	name        = "${var.alb_name}-sg"
	description = "Allow HTTP and HTTPS inbound traffic to ALB"
	vpc_id      = var.vpc_id

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
		Name = "${var.alb_name}-sg"
	}
}

# Application Load Balancer
resource "aws_lb" "this" {
	name               = var.alb_name
	internal           = var.internal
	load_balancer_type = "application"
	security_groups    = [aws_security_group.alb_sg.id]
	subnets            = var.public_subnet_ids
	enable_deletion_protection = false
	tags = {
		Name = var.alb_name
	}
}

# Target Group (HTTP)
resource "aws_lb_target_group" "http" {
	name     = "${var.alb_name}-tg"
	port     = 80
	protocol = "HTTP"
	vpc_id   = var.vpc_id
	health_check {
		path                = "/"
		protocol            = "HTTP"
		matcher             = "200-399"
		interval            = 30
		timeout             = 5
		healthy_threshold   = 2
		unhealthy_threshold = 2
	}
	tags = {
		Name = "${var.alb_name}-tg"
	}
}

# Listener (HTTP)
resource "aws_lb_listener" "http" {
	load_balancer_arn = aws_lb.this.arn
	port              = 80
	protocol          = "HTTP"
	default_action {
		type             = "fixed-response"
		fixed_response {
			content_type = "text/plain"
			message_body = "OK"
			status_code  = "200"
		}
	}
}
