

module "vpc" {
  source          = "./modules/networking"
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  azs             = var.azs
}

module "security" {
  source = "./modules/security"
  vpc_id = module.vpc.vpc_id
}

module "app-servers" {
  source               = "./modules/app-servers"
  instance_type        = var.instance_type
  security_group_names = module.security.security_group_names
  public_subnets       = module.vpc.public_subnets
}
