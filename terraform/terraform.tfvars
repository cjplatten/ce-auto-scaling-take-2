public_subnets  = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
private_subnets = ["10.0.8.0/24", "10.0.9.0/24", "10.0.10.0/24"]
azs             = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
instance_type   = "t2.micro"
as_max_size     = 5
as_min_size     = 1
as_desired_size = 3
