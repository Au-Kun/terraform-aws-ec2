provider "aws" {
  region                  = var.region
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "non-prod"
}

terraform {

  backend "s3" {
    bucket  = "nonprod-tf-state"
    key     = "ec2/example_test.tfstate"
    region  = "us-west-2"
    profile = "non-prod"
  }
}
