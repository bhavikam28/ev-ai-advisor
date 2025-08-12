# ==============================================
# terraform/main.tf
# ==============================================
terraform {
  required_version = ">= 1.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # S3 Backend 
  backend "s3" {
   bucket = "ev-ai-advisor-terraform-state-d54426a5"
   key    = "terraform.tfstate"
   region = "us-east-1"
 }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project   = var.project_name
      ManagedBy = "Terraform"
    }
  }
}

# Random suffix for unique naming
resource "random_id" "suffix" {
  byte_length = 4
}
