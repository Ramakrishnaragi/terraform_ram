resource "aws_instance" "s-1" {
  ami           = "ami-0f535a71b34f2d44a"
  instance_type = "t2.micro"
  key_name      = "mumbai"
tags ={
  Name= "s-2"
  }
}

