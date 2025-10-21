variable "aws_region" {
  description = "AWS region for resouces"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "S3 bucket name for hosting the static website"
  type        = string
  default     = "YourBucketName"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "production"
}

variable "project_name" {
  description = "Name of the Project"
  type        = string
  default     = "Cloud-Resume-Challenge"
}

variable "domain_name" {
  description = "The domain name for Route53 record"
  type        = string
  default     = "YourDomain.com"
}