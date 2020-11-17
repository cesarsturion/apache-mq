# Configure the AWS Provider
provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "gudiao-labs-tfstates-terraform-veloe"
    key    = "eks/terraformt.tfstate"
    region = "us-east-1"
  }
}