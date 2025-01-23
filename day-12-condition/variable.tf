# variable "aws_region" {
#   description = "this region in which to create the infrastructure"
#   type = string
#   nullable = false
#   default = "eu-west-1" # we need to define either ap-south-2
#   validation {
#     condition = var.aws_region == "eu-west-1" || var.aws_region == "us-west-2"
#     error_message = "the variable 'aws_region' must be one of the following regions: ap-south-2, us-west-2"
#   }

# }