
resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/20"


  tags = {
    Name = "ce-auto-scaling"
  }

}


resource "aws_subnet" "public_subnets" {
  count = length(var.public_subnets)

  vpc_id            = aws_vpc.main_vpc.id
  availability_zone = var.azs[count.index]
  cidr_block        = var.public_subnets[count.index]

}

resource "aws_subnet" "private_subnets" {
  count = length(var.private_subnets)

  vpc_id            = aws_vpc.main_vpc.id
  availability_zone = var.azs[count.index]
  cidr_block        = var.private_subnets[count.index]

}

