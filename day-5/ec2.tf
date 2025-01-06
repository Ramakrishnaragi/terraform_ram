resource "aws_instance" "demo" {
  ami = var.ami
  instance_type =var.instance_type 
  subnet_id = aws_subnet.public.id
  key_name = var.key_name
  vpc_security_group_ids = [ aws_security_group.allow_tls.id ]
  tags = {
    Name="public"
  }


}