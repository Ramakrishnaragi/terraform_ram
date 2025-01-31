resource "aws_instance" "name" {
  ami           = "ami-0fd05997b4dff7aac"
  instance_type = "t2.nano"
  key_name      = "mumbai"
tags ={
  Name= "ram-6"
  }
}

