variable "aws_region" {
  description = "AWS region for resouces"
  type        = string
  default = "us-east-1"
}

variable "bucket_name" {
    description = "S3 bucket name for hosting the static website"
    type        = string
    default     = "alandis-cloud-resume-challenge-bucket-2025"
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