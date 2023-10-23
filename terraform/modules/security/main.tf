resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = "Allow http inbound traffic"
  vpc_id      = var.vpc_id
}

resource "aws_security_group_rule" "allow_http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.allow_http.id
}
resource "aws_security_group" "allow_https" {
  name        = "allow_https"
  description = "Allow https inbound traffic"
  vpc_id      = var.vpc_id
}

resource "aws_security_group_rule" "allow_https" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.allow_https.id
}

resource "aws_security_group" "allow_egress" {
  name        = "allow_egress"
  description = "Allow egress inbound traffic"
  vpc_id      = var.vpc_id
}

resource "aws_security_group_rule" "allow_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.allow_egress.id
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow ssh inbound traffic"
  vpc_id      = var.vpc_id
}

resource "aws_security_group_rule" "allow_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = [var.ssh_ip]
  security_group_id = aws_security_group.allow_ssh.id
}
