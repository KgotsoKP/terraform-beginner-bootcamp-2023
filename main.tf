terraform {
  cloud {
    organization = "KgotsoKP"

    workspaces {
      name = "terra-house-first"
    }
  }

  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.6.0"
    }

     aws = {
      source = "hashicorp/aws"
      version = "5.37.0"
    }
  }
}

