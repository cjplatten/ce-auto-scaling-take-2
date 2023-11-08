output "security_group_names" {
  value = [aws_security_group.allow_egress.name, aws_security_group.allow_http.name, aws_security_group.allow_https.name, aws_security_group.allow_ssh.name]
}
