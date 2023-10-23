
resource "aws_instance" "app-servers" {
  count         = var.min_ec2_count
  instance_type = var.instance_type
  launch_template {
    id = aws_launch_template.server.id
  }
}


data "aws_ami" "ubuntu" {
  // Gets the latest ubuntu AMI
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_launch_template" "server" {
  image_id             = data.aws_ami.ubuntu.id
  security_group_names = var.security_group_names
}

