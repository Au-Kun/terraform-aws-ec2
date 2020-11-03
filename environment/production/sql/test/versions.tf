provider "aws" {
  region                  = var.region
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "production" #"non-prod"
}

terraform {

  backend "s3" {
    bucket = "mso-prod-tf-state"
    key    = "ec2/AMOMNISRC_test.tfstate"
    region = "us-west-2"
  }
}
