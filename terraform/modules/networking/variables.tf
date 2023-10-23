variable "public_subnet_cidrs" {
  type        = list(string)
  description = "A list of the CIDR ranges required for the public subnets"
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "A list of the CIDR ranges required for the private subnets"
}
