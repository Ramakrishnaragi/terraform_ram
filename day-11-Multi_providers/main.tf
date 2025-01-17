# s3 bucket creation in mumbai
resource "aws_s3_bucket" "name" {
  bucket = "mumbuck"
}


resource "aws_s3_bucket" "test" {
  bucket   = "mumbuck-1"
  provider = aws.hyd
}

#ec2 creation in hyd
resource "aws_instance" "ec2" {
  ami = data.aws_ami.Demo.id
  instance_type = "t3.micro"
  key_name = "ram"
  provider = aws.hyd #provider.value of alias

}

