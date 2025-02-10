terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    aviatrix = {
      source  = "aviatrixsystems/aviatrix"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

provider "aviatrix" {
  controller_ip = var.aviatrix_controller_ip
  username      = var.aviatrix_username
  password      = var.aviatrix_password
  skip_version_validation = true
}
