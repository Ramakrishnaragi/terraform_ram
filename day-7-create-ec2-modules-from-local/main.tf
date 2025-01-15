module "dev" {
  source = "../day-2"
  ami = "ami-0fd05997b4dff7aac"
  instance_type = "t2.nano"
  key_name = "mumbai"  
#   availability_zone = "ap-south-1b"
}
