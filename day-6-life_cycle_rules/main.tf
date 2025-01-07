provider "aws" {
  
}

resource "aws_instance" "practice" {
  ami = "ami-0fd05997b4dff7aac"
  instance_type = "t2.nano"
  key_name = "mumbai"
  availability_zone = "ap-south-1b"
  tags = {
    Name="practice_instance"
  }

#below examples are for lifecycle meta_arguments 
# lifecycle {
#   create_before_destroy = false
# }

# # #Terraform will error when it attempts to destroy a resource when this is set to true:
# lifecycle {
#   prevent_destroy = true
# }
# #This means that Terraform will never update the object but will be able to create or destroy it.
# lifecycle {
#   ignore_changes = [ tags ]
# }

}