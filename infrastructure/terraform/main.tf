#S3 Bucket
resource "aws_s3_bucket" "resume_bucket" {
    bucket = var.bucket_name

    tags = {
        Name = "Resume Website Bucket"
    } 
}

#Block Public Access
resource "aws_s3_bucket_public_access_block" "resume_bucket_public_access" {
    bucket = aws_s3_bucket.resume_bucket.id

    block_public_acls       = true
    block_public_policy     = true
    ignore_public_acls      = true
    restrict_public_buckets = true
}

resource "aws_s3_bucket_website_configuration" "resume_bucket_website" {
    bucket = aws_s3_bucket.resume_bucket.id

    index_document {
        suffix = "index.html"
    }

    error_document {
        key = "error.html"
    }
  
}

