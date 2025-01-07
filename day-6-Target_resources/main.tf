provider "aws" {
  
}

resource "aws_instance" "dependent" {
    ami = "ami-0fd05997b4dff7aac"
    instance_type = "t2.nano"
    key_name = "mumbai" 
    tags = {
      Name="Demo"
    }
}

resource "aws_s3_bucket" "dependent" {
    bucket = "ytvhshfbbcjfkjif" 
}

# terraform apply -target=aws_s3_bucket.dependent
# terraform destroy -target=aws_s3_bucket.dependent
