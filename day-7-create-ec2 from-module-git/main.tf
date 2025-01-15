module "ec2_server" {
  source = "github.com/Ramakrishnaragi/terraform_ram/day-2"
  ami ="ami-0fd05997b4dff7aac"
  instance_type="t2.nano"
  key_name="mumbai"
  
}