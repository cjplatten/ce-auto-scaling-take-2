
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