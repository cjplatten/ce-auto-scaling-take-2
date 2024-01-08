
resource "aws_lb_target_group" "lb-tg" {
  name             = "load-balancing-lb-tg"
  port             = 3000
  protocol         = "HTTP"
  protocol_version = "HTTP1"
  vpc_id           = var.vpc_id

  health_check {
    path     = "/health-check"
    protocol = "HTTP"
  }
}

resource "aws_lb_target_group_attachment" "lb-tg-a" {

  target_group_arn = aws_lb_target_group.lb-tg.arn
  target_id        = var.target_id
}

resource "aws_lb" "lb" {
  name               = "load-balancing-lb"
  internal           = false
  load_balancer_type = "application"
  subnets            = var.subnet_ids
  security_groups    = var.security_group_ids
}

resource "aws_lb_listener" "lb-listener" {
  port              = 80
  protocol          = "HTTP"
  load_balancer_arn = aws_lb.lb.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb-tg.arn
  }
}

resource "aws_autoscaling_attachment" "asg_attachment" {
  autoscaling_group_name = var.autoscaling_group_id
  lb_target_group_arn    = aws_lb_target_group.lb-tg.arn
}
