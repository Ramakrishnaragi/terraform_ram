#using ami through datablocks and values for variables
resource "aws_instance" "ec2" {
  ami = data.aws_ami.name.id
  instance_type = var.instance_type
  key_name = var.key_name
#    count = length(var.name)
  for_each = toset(var.name)

  tags = {
     Name= each.value
    # Name= var.name[count.index]
  }
} 