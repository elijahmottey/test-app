variable "bucket_name" {
    description = "The name of the S3 bucket"
    type        = string
  
}
variable "lock_bucket_name" {
    description = "The name of the S3 bucket for Terraform backend"
    type        = string
  
}

variable "region" {
    description = "The AWS region to deploy resources"
    type        = string
  
}

variable "dynamodb_table_name" {
    description = "The name of the DynamoDB table for Terraform backend locking"
    type        = string
  
}


