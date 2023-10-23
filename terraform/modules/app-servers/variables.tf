
variable "min_ec2_count" {
  type        = number
  description = "The minimum amount of EC2 instances to create"
}

variable "instance_type" {
  type        = string
  description = "The instance type of EC2 to create"
}

variable "security_group_names" {
  type = list(string)
  description = "A list of the security group names to be applied to the Launch Templates"
}

variable "public_subnets" {
  type = list(string)
  description = "A list of public subnets to launch your EC2 instances in"
}