#example-2 with variables list of string
resource "aws_instance" "practice" {
  ami = data.aws_ami.name.id
  instance_type = var.instance_type
  count = length(var.sandboxs)

  tags = {
    Name= var.sandboxs[count.index]
  }

}