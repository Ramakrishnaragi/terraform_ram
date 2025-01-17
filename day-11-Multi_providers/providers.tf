#default region 
provider "aws" {
  region = "ap-south-1"
}

#another provider alias
provider "aws" {
  region = "ap-south-2"
  alias  = "hyd"
}


