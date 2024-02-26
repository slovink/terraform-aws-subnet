# Terraform version
terraform {
  required_version = ">= 1.6.4, < 1.7.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.32.1"
    }
  }
}
