resource "aws_instance" "name" {
  ami           = "ami-0f535a71b34f2d44a"
  instance_type = "t2.micro"
  key_name      = "com4"
tags ={
  Name= "s-1"
  }
}

