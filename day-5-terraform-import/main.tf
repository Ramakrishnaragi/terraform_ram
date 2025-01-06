
resource "aws_instance" "import_ec2" {
    ami = "ami-0fd05997b4dff7aac"
    instance_type = "t2.micro"
    tags = {
      Name = "import_ec2"
    }
  
}