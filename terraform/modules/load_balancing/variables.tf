variable "target_id" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "security_group_ids" {
  type = list(string)
}

variable "autoscaling_group_id" {
  type = string
}

variable "autoscaling_group_arn" {
  type = string
}