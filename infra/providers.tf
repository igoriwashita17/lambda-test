terraform {
  backend "s3" {
    bucket = "terraform-files"
    key    = "tf/config"
    region = "ap-northeast-1"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
  
provider "aws" {
  region = "us-east-1"
}