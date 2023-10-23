
resource "aws_instance" "app-servers" {
  count         = var.min_ec2_count
  instance_type = var.instance_type
  subnet_id     = var.public_subnets[count.index]

  launch_template {
    id = aws_launch_template.server.id
  }
}


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

resource "aws_launch_template" "server" {
  image_id             = data.aws_ami.ubuntu.id
  security_group_names = var.security_group_names

}

