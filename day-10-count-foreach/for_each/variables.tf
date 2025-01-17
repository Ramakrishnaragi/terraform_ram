# variable "ami" {
#   type = string
#   default = ""
# }

variable "instance_type" {
  type = string
  default = "t2.micro"
}
variable "key_name" {
  type = string
  default = "mumbai"
}

variable "name" {
  type = list(string)
  default = [ "test","dev" ]
}