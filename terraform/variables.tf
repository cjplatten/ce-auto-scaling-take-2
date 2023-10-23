variable "public_subnets" {
  type        = list(string)
  description = "A list of the CIDR ranges required for the public subnets"
}

variable "private_subnets" {
  type        = list(string)
  description = "A list of the CIDR ranges required for the private subnets"
}

variable "azs" {
  type        = list(string)
  description = "A list of the Availability Zones you wish to provision infrastructure in"
}

variable "ssh_ip" {
  type        = string
  description = "The IP address of the computer you wish SSH from"
}

variable "min_ec2_count" {
  type        = number
  description = "The minimum amount of EC2 instances to create"
}

variable "instance_type" {
  type        = string
  description = "The instance type of EC2 to create"
}
