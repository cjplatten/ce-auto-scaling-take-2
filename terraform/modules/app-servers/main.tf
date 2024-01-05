// data blocks will make a request for information that we may not have already or sometimes changes
data "aws_ami" "ubuntu" {
  // Gets the latest ubuntu AMI ID
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical's ID - creators of the Ubuntu AMI
}

resource "aws_instance" "app_server" {
  # count                       = 0
  instance_type               = var.instance_type
  subnet_id                   = var.public_subnets[0]
  vpc_security_group_ids      = var.security_group_ids
  ami                         = data.aws_ami.ubuntu.id
  associate_public_ip_address = true
  key_name                    = "ProjectKeyPair"

  tags = {
    Name = "app_server_autoscale"
  }
}

resource "aws_ami_from_instance" "autoscale-ami" {
  name               = "autoscale-ami"
  source_instance_id = aws_instance.app_server.id

}

resource "aws_launch_template" "autoscale_lt" {
  instance_type          = var.instance_type
  image_id               = data.aws_ami.ubuntu.id
  key_name               = "ProjectKeyPair"
  # vpc_security_group_ids = var.security_group_ids

  network_interfaces {
    subnet_id                   = var.public_subnets[0]
    associate_public_ip_address = true
    security_groups = var.security_group_ids
  }

  tags = {
    Name = "app_server_autoscale"
  }

  user_data = filebase64("${path.module}/user_data.sh")
}

# You should have variables that allow us to configure the ASG to control:

#     the minimum amount of instances
#     the desired amount of instances
#     the maximum amount of instances

resource "aws_autoscaling_group" "asg" {
  name             = "autoscaling_asg"
  max_size         = var.as_max_size
  min_size         = var.as_min_size
  desired_capacity = var.as_desired_size
  launch_template {
    id = aws_launch_template.autoscale_lt.id
  }
}
