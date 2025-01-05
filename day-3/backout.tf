terraform {
  backend "s3" {
    bucket         = "ramaaa-1"
    key            = "windows-statefile"
    region         = "ap-south-1"
    encrypt        = true
  }
}

