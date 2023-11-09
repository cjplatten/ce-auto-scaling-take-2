
variable "instance_type" {
  type        = string
  description = "The instance type of EC2 to create"
}


variable "public_subnets" {
  type        = list(string)
  description = "A list of public subnets to launch your EC2 instances in"
}

variable "security_group_ids" {
  type        = list(string)
  description = "A list of security group IDs to apply to the instances"
}
