# Configure the AWS Provider
provider "aws" {
  version = "~> 2.0"
  region  = var.region
}

terraform {
  backend "s3" {
    bucket = "gudiao-labs-tfstates-terraform-us-east-2"
    key    = "eks/terraformt.tfstate"
    region = "us-east-1"
  }
}