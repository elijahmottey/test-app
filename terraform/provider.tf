provider "aws" {
    region = "${var.region}"
  
}

terraform {

  backend "s3" {

  bucket = "${var.lock_bucket_name}"
  region = "${var.region}"
  key    = "lock/terraform.tfid/terraform.tfstate"
  encrypt = true
  dynamodb_table = "${var.dynamodb_table_name}"

}

}