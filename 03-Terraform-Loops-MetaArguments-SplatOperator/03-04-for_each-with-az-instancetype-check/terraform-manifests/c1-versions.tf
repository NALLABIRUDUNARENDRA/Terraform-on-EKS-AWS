terraform {
required_version = "~> 1.5" # Which Means Any Version Equal & Above
required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  } 
}

provider "aws" {
  region = var.aws_region
}
