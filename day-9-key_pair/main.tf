#create a new key pair 
resource "aws_key_pair" "key_pair" {
  key_name = "key_pair"
  public_key = file("~/.ssh/id_rsa.pub")
}

#create a ec2 from local-keypair
resource "aws_instance" "ec2" {
  ami= "ami-096f476985f829eb4"
  instance_type = "t2.nano"
  key_name = aws_key_pair.key_pair.id
}