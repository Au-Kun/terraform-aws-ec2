provider "aws" {
  region                  = var.region
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "non-prod"
}

terraform {

  backend "s3" {
    bucket  = "mso-nonprod-tf-state"
    key     = "ec2/uat1fssql02.tfstate"
    region  = "us-west-2"
    profile = "non-prod"
  }
}
