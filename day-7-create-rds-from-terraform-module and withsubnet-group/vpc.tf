#vpc
resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Custom_vpc"
  }
}

#igw
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "igw"
  }
}

#public subnet
resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "ap-south-1a"
  tags = {
    Name = "public_subnet"
  }
}

#private subnet
resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-south-1b"
  tags = {
    Name = "private_subnet"
  }
}

#elastic ip for NAT
# resource "aws_eip" "EIP" {
#   tags = {
#     Name="EIP"
#   }
# }

#NAT
# resource "aws_nat_gateway" "NAT" {
#   subnet_id = aws_subnet.public_subnet.id
#   allocation_id = aws_eip.EIP.id
# }

#create rt for public
resource "aws_route_table" "public_RT" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "public_RT"
  }
}

#create rt for private
resource "aws_route_table" "private_RT" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "private_RT"
  }
}

#association RT to public subnet
resource "aws_route_table_association" "public_RT_ass" {
  route_table_id = aws_route_table.public_RT.id
  subnet_id      = aws_subnet.public_subnet.id

}

#association RT to private subnet
resource "aws_route_table_association" "private_RT_ass" {
  route_table_id = aws_route_table.private_RT.id
  subnet_id      = aws_subnet.private_subnet.id
}

#create sg
resource "aws_security_group" "custom_sg" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "custom_sg"
  }
  ingress = [
    for port in [80, 22, 3306, 443] : {
      description      = "TLS from VPC"
      from_port        = port
      to_port          = port
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = []
      security_groups   = []
      self             = false
    }
  ]

  egress  {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}