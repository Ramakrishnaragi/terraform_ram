#example-3 with numeric condition if ec2 instance = t2.nano only
resource "aws_instance" "test" {
  ami = "ami-0d2614eafc1b0e4d2"
  instance_type = var.instance_type
  count = var.instance_type == "t2.nano" ? 1:0
  tags = {
    Name="dev-server"
  }
}