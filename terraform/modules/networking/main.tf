
resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "autoscaling-sprint"
  }

}


resource "aws_subnet" "public_subnets" {
  count = 3

  vpc_id     = aws_vpc.main_vpc.vpc_id
  cidr_block = var.public_subnet_cidrs[count.index]

}

resource "aws_subnet" "private_subnets" {
  count = 3

  vpc_id     = aws_vpc.main_vpc.vpc_id
  cidr_block = var.private_subnet_cidrs[count.index]

}

