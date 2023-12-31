# Terraform Block
terraform {
  required_version = "~> 1.3.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

terraform {
  cloud {
    organization = "skillupwithstan"

    workspaces {
      name = "cli-driven-aws"
    }
  }
}

# Provider Block
provider "aws" {
  region  = var.aws_region
}


