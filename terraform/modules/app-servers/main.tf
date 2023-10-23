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

resource "aws_instance" "app-servers" {
  count = var.min_ec2_count

  instance_type   = var.instance_type
  subnet_id       = var.public_subnets[count.index]
  security_groups = var.security_group_names
  ami             = data.aws_ami.ubuntu.id

}




