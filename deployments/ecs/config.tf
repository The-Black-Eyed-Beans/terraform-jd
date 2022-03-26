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
  shared_config_files      = [var.SHARED_CONFIG_FILES]
  shared_credentials_files = [var.SHARED_CREDENTIALS_FILES]
  profile                  = "joshua"
}

terraform {
  backend "s3" {}
}
