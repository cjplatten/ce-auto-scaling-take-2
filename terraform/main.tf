

module "vpc" {
  source          = "./modules/networking"
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  azs             = var.azs
}

module "security" {
  source = "./modules/security"
  ssh_ip = var.ssh_ip
  vpc_id = module.vpc.vpc_id
}

module "app-servers" {
  source               = "./modules/app-servers"
  min_ec2_count        = var.min_ec2_count
  instance_type        = var.instance_type
  security_group_names = module.security.security_group_names
}
