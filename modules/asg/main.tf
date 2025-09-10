# Launch Template
resource "aws_launch_template" "this" {
	name_prefix   = var.launch_template_name
	image_id      = var.ami_id
	instance_type = var.instance_type
	key_name      = var.key_name != "" ? var.key_name : null
	vpc_security_group_ids = var.security_group_ids
	tag_specifications {
		resource_type = "instance"
		tags = {
			Name = var.launch_template_name
		}
	}
}

# Auto Scaling Group
resource "aws_autoscaling_group" "this" {
	name                      = var.asg_name
	max_size                  = var.max_size
	min_size                  = var.min_size
	desired_capacity          = var.desired_capacity
	vpc_zone_identifier       = var.subnet_ids
	health_check_type         = "EC2"
	health_check_grace_period = 300
	launch_template {
		id      = aws_launch_template.this.id
		version = "$Latest"
	}
	tag {
		key                 = "Name"
		value               = var.asg_name
		propagate_at_launch = true
	}
	lifecycle {
		create_before_destroy = true
	}
}
