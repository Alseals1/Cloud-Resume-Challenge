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

output "route53_name_servers" {
  description = "Route 53 name servers"
  value       = aws_route53_zone.main.name_servers
}

output "hosted_zone_id" {
  description = "Route 53 hosted zone ID"
  value       = aws_route53_zone.main.zone_id
}

output "dynamodb_table_name" {
  description = "Name Of Dynamodb table"
  value       = aws_dynamodb_table.visit_counter.name
}

output "dynamodn_arn" {
description = "ARN of Dynamodb table"
value      = aws_dynamodb_table.visit_counter.arn
}