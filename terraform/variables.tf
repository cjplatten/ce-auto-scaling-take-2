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

variable "instance_type" {
  type        = string
  description = "The instance type of EC2 to create"
}

variable "as_max_size" {
  type = number
  description = "maximum number of instances in autoscaling group"
}

variable "as_min_size" {
  type = number
  description = "minimum number of instances in autoscaling group"
}

variable "as_desired_size" {
  type = number
  description = "desired number of instances in autoscaling group"
}