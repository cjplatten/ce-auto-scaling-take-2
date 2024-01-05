

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
  source             = "./modules/app-servers"
  instance_type      = var.instance_type
  security_group_ids = module.security.security_group_ids
  public_subnets     = module.vpc.public_subnets_ids
  as_max_size        = var.as_max_size
  as_min_size        = var.as_min_size
  as_desired_size    = var.as_desired_size
}
