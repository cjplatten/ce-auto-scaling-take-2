output "autoscaling_group_id" {
  value = aws_autoscaling_group.asg.id
}

output "autoscaling_group_arn" {
  value = aws_autoscaling_group.asg.arn
}

output "instance_ids" {
  description = "EC2 instance id"
  value = aws_instance.app_server.id
}