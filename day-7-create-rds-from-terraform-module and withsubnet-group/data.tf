data "aws_subnet" "public_subnet" {
  filter {
    name   = "tag:Name"
    values = ["public_subnet"]
  }
}
data "aws_subnet" "private_subnet" {
  filter {
    name   = "tag:Name"
    values = ["private_subnet"]
  }
}