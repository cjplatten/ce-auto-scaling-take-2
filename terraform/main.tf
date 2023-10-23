

module "vpc" {
    source = "./modules/networking"
    public_subnet_cidrs = var.public_subnet_cidrs
    private_subnet_cidrs = var.private_subnet_cidrs
  
}