#ec2 in default region
resource "aws_instance" "name" {
  ami           = data.aws_ami.name.id
  instance_type = "t2.nano"
  key_name      = "mumbai"
}

#ec2 in hyderabad region
resource "aws_instance" "test" {
  ami           = data.aws_ami.Demo.id
  instance_type = "t3.micro"
  key_name      = "ram"
  provider      = aws.hyd
  tags = {
    Name="hyd"
  }
}