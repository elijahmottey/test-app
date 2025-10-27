provider "aws" {
  
}

terraform {

  backend "s3" {

  bucket = "terraform-gitaction-v1"
  region = "us-east-1"
  key    = "lock/terraform.tfid/terraform.tfstate"
  encrypt = true
  dynamodb_table = "tr-gha-resources"

}

}