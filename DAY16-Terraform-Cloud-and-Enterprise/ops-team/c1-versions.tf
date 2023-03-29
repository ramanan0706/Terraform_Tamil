# Terraform Block
terraform {
  required_version = "~> 1.4.0"
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
      name = "OPS-TEAM"
    }
  }
}

# Provider Block
provider "aws" {
  region  = "ap-south-1"
}


