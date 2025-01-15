#Retrieve the existing subnet details using its tags.
data "aws_subnet" "name" {
  filter {
    name = "tag:Name"
    values = ["public_subnet"]
  }
}

data "aws_ami" "name" {
  most_recent = true
  owners = [ "amazon" ]
  filter {
    name = "name"
    values = ["amzn2-ami-hvm-*-gp2"]
  }
  filter {
    name = "architecture"
    values = ["x86_64"]
  }
}