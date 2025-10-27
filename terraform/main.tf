
resource "aws_s3_bucket" "static-site" {
  bucket = "${var.bucket_name}-${random_id.suffix.hex}"
    
  tags = {
    Name        = "StaticSiteBucket"
    Environment = "Dev"
  }
  
}

resource "random_id" "suffix" {
  byte_length = 4
}