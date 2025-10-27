
resource "aws_s3_bucket" "static-site" {
    bucket = var.bucket-name

    
  tags = {
    Name        = "StaticSiteBucket"
    Environment = "Dev"
  }
  
}