output "s3_bucket_name" {
  description = "Name of S3 bucket"
  value       = aws_s3_bucket.resume_bucket.bucket
}

output "cloudfront_domain_name" {
  description = "CloudFront Distribution Domain Name"
  value       = aws_cloudfront_distribution.resume_distribution.domain_name
}

output "cloudfront_distribution_id" {
  description = "CloudFront distribution ID (for cache invalidation)"
  value       = aws_cloudfront_distribution.resume_distribution.id
}

output "website_url" {
  description = "Full website URL"
  value       = "https://${aws_cloudfront_distribution.resume_distribution.domain_name}"
}