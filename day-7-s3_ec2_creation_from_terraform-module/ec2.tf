module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "single-instance"

  instance_type          = "t2.nano"
  key_name               = "mumbai"
  monitoring             = true
#   vpc_security_group_ids = ["sg-12345678"]
#    subnet_id              = "subnet-eddcdzz4"

  # tags = {
  #   Terraform   = "true"
  #   Environment = "dev"
  # }
}