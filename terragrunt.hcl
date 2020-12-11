remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket         = "mso-non-production-tfstate"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "us-west-2"
    profile        = "non-prod"
    encrypt        = true
    dynamodb_table = "my-lock-table"
  }
}