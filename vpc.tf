resource "aws_vpc" "olochvpc" {
  cidr_block = "10.3.0.0/16"
  tags = {
    Name = "olochvpc"
  }
}

resource "aws_subnet" "olochsubnet" {
  vpc_id            = aws_vpc.olochvpc.id
  cidr_block        = "10.3.1.0/24"
  availability_zone = var.availability_zone

  tags = {
    Name = "olochsubnet"
  }
}


resource "aws_internet_gateway" "olochigw" {
  vpc_id = aws_vpc.olochvpc.id

  tags = {
    Name = "olochigw"
  }
}

resource "aws_default_route_table" "olochrt" {
  default_route_table_id = aws_vpc.olochvpc.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.olochigw.id
  }

  tags = {
    Name = "olochrt"
  }
}

resource "aws_default_security_group" "olochsg" {
  vpc_id = aws_vpc.olochvpc.id

  dynamic "ingress" {
    for_each = var.ingress
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["10.3.0.0/16"]
    }
  }
  dynamic "egress" {
    for_each = var.egress
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
