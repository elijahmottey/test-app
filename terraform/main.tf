
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

resource "aws_s3_bucket_website_configuration" "static-site-website" {
  bucket = aws_s3_bucket.static-site.id

  index_document {
    suffix = "index.html"
  }

 
  
}

resource "aws_s3_bucket_public_access_block" "blockaccess" {
    bucket = aws_s3_bucket.static-site.id
    block_public_acls = false
    block_public_policy = false
    ignore_public_acls = false
    restrict_public_buckets = false
  
  
}

resource "aws_s3_bucket_policy" "s3_static_website_policy" {
  bucket = aws_s3_bucket.static-site.bucket

  policy = jsonencode({
    Version = "2012-10-17"
    Id      = "PolicyForPublicWebsiteContent"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "arn:aws:s3:::${aws_s3_bucket.static-site.bucket}/*"
      }
    ]
  })

  depends_on = [aws_s3_bucket_public_access_block.blockaccess]
}


