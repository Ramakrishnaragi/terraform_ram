#default state file 
resource "aws_instance" "name" {
  ami = "ami-0d2614eafc1b0e4d2"
  instance_type = "t2.micro"
  key_name = "mumbai"
}