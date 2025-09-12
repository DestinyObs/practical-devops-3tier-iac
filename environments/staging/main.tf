
module "keypair" {
  source         = "../../modules/keypair"
  key_pair_name  = "practical-devops-key"
}


module "vpc" {
  source               = "../../modules/vpc"
  vpc_name             = var.vpc_name
  cidr_block           = var.cidr_block
  azs                  = var.azs
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}


module "alb" {
  source            = "../../modules/alb"
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  alb_name          = var.alb_name
  internal          = var.internal
}


module "rds" {
  source             = "../../modules/rds"
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
  rds_name           = var.rds_name
  db_name            = var.db_name
  db_instance_class  = var.db_instance_class
  db_username        = var.db_username
  db_password        = var.db_password
}


module "asg" {
  source               = "../../modules/asg"
  asg_name             = var.asg_name
  launch_template_name = var.launch_template_name
  ami_id               = var.ami_id
  instance_type        = var.instance_type
  subnet_ids           = module.vpc.private_subnet_ids
  security_group_ids   = [module.alb.alb_security_group_id]
  key_name             = module.keypair.key_pair_name # Use generated key pair
  min_size             = var.min_size
  max_size             = var.max_size
  desired_capacity     = var.desired_capacity
}


module "ec2" {
  source              = "../../modules/ec2"
  ami_id              = var.ami_id
  instance_type       = var.instance_type
  subnet_id           = module.vpc.public_subnet_ids[0]
  vpc_id              = module.vpc.vpc_id
  security_group_ids  = [module.alb.alb_security_group_id]
  key_name            = module.keypair.key_pair_name # Use generated key pair
  ec2_name            = "practical-devops-appserver"
}
