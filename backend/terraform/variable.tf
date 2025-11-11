variable "project_name" {
  description = "Name of the Project"
  type        = string
  default     = "Cloud-Resume-Challenge"
}

variable "aws_region" {
  description = "AWS region for resouces"
  type        = string
  default     = "us-east-1"
}

variable "alert_email" {
  description = "Email address to receive Lambda alerts"
  type        = string
  default     = "1seals.alandis@gmail.com"

}

