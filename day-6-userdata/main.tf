resource "aws_instance" "dev" {
  ami                    = "ami-0fd05997b4dff7aac"
  instance_type          = "t2.nano"
  key_name               = "mumbai"
  user_data = file("userdata.sh")
  tags = {
    Name="key-tf"
  }
}