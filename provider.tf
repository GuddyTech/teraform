provider "aws" {
  region = "us-east-1"
}
terraform {
  backend "s3" {
    bucket = "slide-908"
    key    = "terraform.statetf"
    region = "us-east-1"
    dynamodb_table = "dynamodb_state_locking"
  }
}
