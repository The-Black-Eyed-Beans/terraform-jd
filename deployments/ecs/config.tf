terraform {
  required_providers {
    aws = {
        source               = "hashicorp/aws"
        version              = ">= 3.0"
    }
  }
  required_version           = ">= 0.12"
}

provider "aws" {
  region                   = var.AWS_REGION
  shared_config_files      = ["$HOME/.aws/config"]
  shared_credentials_files = ["$HOME/.aws/credentials"]
  profile                  = var.AWS_PROFILE
}

terraform {
  backend "s3" {}
}