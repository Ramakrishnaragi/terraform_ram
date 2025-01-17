#ex-1 without list variable
resource "aws_instance" "ec2" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = "mumbai"
  count = 2
  tags = {
    Name="webec2-${count.index}"
  }
}

#it is not a best practice because it is not a perfect action