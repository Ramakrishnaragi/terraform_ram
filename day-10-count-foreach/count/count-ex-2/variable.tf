# variable "ami" {
#   type = string
#   default = ""
# }

variable "instance_type" {
  type = string
  default = "t2.nano"
}

variable "sandboxs" {
  type = list(string)
  default = [  "test-2","test-3" ]
}