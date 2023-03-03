  terraform {
    backend "s3" {
        bucket = "anuj-se-bucket"
        key    = "anuj_terraform.tfstate"
        region = "us-east-1"
        dynamodb_table = "anuj-vpc-backend"
    }
  }