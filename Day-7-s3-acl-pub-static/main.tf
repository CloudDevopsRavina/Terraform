
#creating s3 bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "ravinarathod"

  tags = {
    Name        = "My S3 Bucket"
    Environment = "dev"
  }
}
#enabling versioning for objects
resource "aws_s3_bucket_versioning" "my-versioning" {
  bucket = aws_s3_bucket.my_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
  
}

#giving pulic access
resource "aws_s3_bucket_public_access_block" "public-access" {
  bucket = aws_s3_bucket.my_bucket.id

  block_public_acls = false
  block_public_policy = false
  ignore_public_acls = false
  restrict_public_buckets = false
  
}


#giving policy
# resource "aws_s3_bucket_policy" "public_read" {
#   bucket = aws_s3_bucket.my_bucket.id

#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Sid       = "PublicReadGetObject"
#         Effect    = "Allow"
#         Principal = "*"
#         Action    = "s3:GetObject"
#         Resource  = "${aws_s3_bucket.my_bucket.arn}/*"
#       }
#     ]
#   })
# }
resource "aws_s3_bucket_policy" "public_read" {
  bucket = aws_s3_bucket.my_bucket.id

  depends_on = [aws_s3_bucket_public_access_block.public-access]

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.my_bucket.arn}/*"
      }
    ]
  })
}

resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket.my_bucket.id
  key          = "index.html"
  source       = "index.html"
  content_type = "text/html"
}

resource "aws_s3_bucket_website_configuration" "website_config" {
  bucket = aws_s3_bucket.my_bucket.id

  index_document {
    suffix = "index.html"
  }

  # error_document {
  #   key = "error.html"
  # }
}