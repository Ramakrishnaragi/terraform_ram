resource "aws_instance" "name" {
  ami           = "ami-0fd05997b4dff7aac"
  instance_type = "t2.nano"
  key_name      = "com4"
tags ={
  Name= "ram-1"
  }
}

