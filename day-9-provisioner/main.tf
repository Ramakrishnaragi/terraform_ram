#create new key pair
resource "aws_key_pair" "key" {
  key_name   = "key-pair"
  public_key = file("~/.ssh/id_rsa.pub")
}

#create a ec2 from new key
resource "aws_instance" "ec2" {
  ami           = "ami-096f476985f829eb4"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.key.id
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("~/.ssh/id_rsa")
    host        = self.public_ip
  }
  #upload file to ec2 
  provisioner "file" {
    source      = "file.txt"
    destination = "/home/ec2-user/file.txt"
  }
  #execute cmd on ec2 instance
  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install httpd -y",
      "sudo systemctl start httpd",
      "sudo sh -c 'echo \"myserver - from provisioner\" > /var/www/html/index.html'"
      #   "sudo 'echo <h1>this is code </h1> > /var/www/html/inde.html'"
    ]
  }

  #executes cmd locally(on the machine running terraform)
  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> deployed_ips.txt"
  }
}