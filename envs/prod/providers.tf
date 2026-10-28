terraform {
  required_version = ">= 1.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

# Fixture only: CI plans with placeholder credentials and makes no AWS call.
# These resources are never applied.
provider "aws" {
  region                      = "ap-southeast-2"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
}
