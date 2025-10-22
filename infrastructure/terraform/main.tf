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


# CloudFront Distribution
resource "aws_cloudfront_origin_access_control" "resume_oac" {
  name                              = "${var.project_name}-oac"
  description                       = "OAC for resume S3 bucket"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

resource "aws_cloudfront_distribution" "resume_distribution" {
  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"
  price_class         = "PriceClass_100"

  aliases = [var.domain_name, "www.${var.domain_name}"]



  origin {
    domain_name              = aws_s3_bucket.resume_bucket.bucket_regional_domain_name
    origin_id                = "S3-${var.bucket_name}"
    origin_access_control_id = aws_cloudfront_origin_access_control.resume_oac.id
  }

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "S3-${var.bucket_name}"

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
    compress               = true
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
    acm_certificate_arn            = aws_acm_certificate.resume_cert.arn
    ssl_support_method             = "sni-only"
    minimum_protocol_version       = "TLSv1.2_2021"

  }

  depends_on = [aws_acm_certificate.resume_cert]

  tags = {
    Name = "Resume CloudFront Distribution"
  }
}

# S3 Bucket Policy to allow CloudFront access
resource "aws_s3_bucket_policy" "resume_bucket_policy" {
  bucket = aws_s3_bucket.resume_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowCloudFrontServicePrincipal"
        Effect = "Allow"
        Principal = {
          Service = "cloudfront.amazonaws.com"
        }
        Action   = "s3:GetObject"
        Resource = "${aws_s3_bucket.resume_bucket.arn}/*"
        Condition = {
          StringEquals = {
            "AWS:SourceArn" = aws_cloudfront_distribution.resume_distribution.arn
          }
        }
      }
    ]
  })
}


# Route 53 Hosted Zone
resource "aws_route53_zone" "main" {
  name = var.domain_name

  tags = {
    Name = "${var.project_name} Hosted Zone"
  }
}

resource "aws_route53_record" "website_a" {
  zone_id = aws_route53_zone.main.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.resume_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.resume_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}

# Route 53 AAAA Record - IPv6 support
resource "aws_route53_record" "website_aaaa" {
  zone_id = aws_route53_zone.main.zone_id
  name    = var.domain_name
  type    = "AAAA"

  alias {
    name                   = aws_cloudfront_distribution.resume_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.resume_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "website_www_a" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "www.${var.domain_name}"
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.resume_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.resume_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "website_www_aaaa" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "www.${var.domain_name}"
  type    = "AAAA"

  alias {
    name                   = aws_cloudfront_distribution.resume_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.resume_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "resume_cert_validation" {
  for_each = {
    for dvo in aws_acm_certificate.resume_cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  zone_id         = aws_route53_zone.main.zone_id
  name            = each.value.name
  type            = each.value.type
  ttl             = 60
  records         = [each.value.record]
}


# ACM Certificate 
resource "aws_acm_certificate" "resume_cert" {
  provider          = aws.us_east_1
  domain_name       = var.domain_name
  validation_method = "DNS"

  subject_alternative_names = ["www.${var.domain_name}"]


  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_dynamodb_table" "visit_counter" {
  name        = "${var.project_name}-visit-counter"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "couter_id"

  attribute {
    name = "couter_id"
    type = "S"
  }

  server_side_encryption {
    enabled = true
  }

  tags = {
    Name = "Visit Counter Table"
  }
}