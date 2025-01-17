provider "aws" {
  
}

#locals are constant or fixed
locals {
  region="ap-south-1"
  environment="dev"
  instance_type="t2.micro"
  ami=data.aws_ami.name.id
}


resource "aws_instance" "ec2" {
  ami=local.ami
  instance_type = local.instance_type
  tags = {
    Name="test"
    environment=local.environment
  }
}
