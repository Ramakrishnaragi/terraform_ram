#ec2 from datablock
resource "aws_instance" "ec2" {
  ami = data.aws_ami.name.id
  instance_type = "t2.micro"
  subnet_id = data.aws_subnet.name.id
  key_name = "mumbai"
  associate_public_ip_address = true
  tags = {
    Name="ec2"
  }
}
