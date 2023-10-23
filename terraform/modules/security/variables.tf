variable "vpc_id" {
  type        = string
  description = "The VPC ID that you wish to create the security groups in"
}

variable "ssh_ip" {
  type        = string
  description = "The IP address of the computer you wish SSH from"
}
