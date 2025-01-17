resource "aws_iam_user" "name" {
  count = length(var.user_names)
  name = var.user_names[count.index]

#   lifecycle {
#     create_before_destroy = true
#   }
 }