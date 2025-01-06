# Create VPC
resource "aws_vpc" "custom" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "custom_vpc"
  }
}

# Create Internet Gateway (IGW)
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.custom.id
}

# Create Elastic IP for NAT Gateway
resource "aws_eip" "nat_eip" {
  domain = "vpc" # Associate the Elastic IP with the VPC
}

# Create Public Subnet
resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.custom.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "ap-south-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "public_sub"
  }
}

# Create Private Subnet
resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.custom.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-south-1b"
  map_public_ip_on_launch = false
  tags = {
    Name = "private_sub"
  }
}

# Create NAT Gateway in the public subnet
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public.id

  depends_on = [aws_eip.nat_eip]
}

# Create Route Table for the Private Subnet
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.custom.id
}

# Create a Route in the Private Route Table for outbound internet traffic through the NAT Gateway
resource "aws_route" "private_route" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"  # All outbound traffic
  nat_gateway_id         = aws_nat_gateway.nat.id
}

# Associate the Private Route Table with the Private Subnet
resource "aws_route_table_association" "private_association" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}

# Create Route Table for Public Subnet (with default route to IGW)
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.custom.id
}

# Create a default route to the Internet Gateway (IGW) for the public subnet
resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"  # All outbound traffic
  gateway_id             = aws_internet_gateway.igw.id
}

# Associate the Public Route Table with the Public Subnet
resource "aws_route_table_association" "ass_pub" {
  route_table_id = aws_route_table.public_rt.id
  subnet_id      = aws_subnet.public.id
}

# Create a Security Group allowing HTTP (80) and SSH (22) traffic
resource "aws_security_group" "allow_tls" {
  name   = "allow_tls"
  vpc_id = aws_vpc.custom.id
  tags = {
    Name = "custom_sg"
  }

  ingress {
    description = "HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
