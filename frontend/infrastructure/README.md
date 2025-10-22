# Cloud Resume Challenge - Infrastructure as Code

This README contains the Terraform configuration for deploying the AWS infrastructure supporting the Cloud Resume Challenge application.

## Architecture Overview

![Architecture Diagram](/infrastructure/assets/cloudResumeDiagram.png)

The infrastructure implements a serverless architecture with the following AWS services:

### Frontend

- **CloudFront**: Content delivery network for global distribution
- **S3**: Static website hosting for the resume site
- **Route 53**: DNS management and routing
- **AWS Certificate Manager**: SSL/TLS certificate management for HTTPS

### Backend

- **API Gateway**: RESTful API endpoint for visitor counter
- **Lambda**: Serverless function to handle API requests and business logic
- **DynamoDB**: NoSQL database for storing visitor count data

## Current Infrastructure Status

⚠️ **Note**: This infrastructure is actively being developed and is subject to changes. Additional services and features will be added as the project evolves.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) >= 1.0
- [AWS CLI](https://aws.amazon.com/cli/) configured with appropriate credentials
- An AWS account with appropriate permissions
- A registered domain name (for Route 53 configuration)

## Infrastructure Components

### Frontend Distribution

- CloudFront distribution with custom domain
- S3 bucket configured for static website hosting
- SSL/TLS certificate from ACM
- Route 53 hosted zone and DNS records

### Security & Permissions

- Least privilege IAM roles
- CloudFront Origin Access Identity for S3

## Getting Started

### 1. Clone the Repository

```bash
git clone <This repo>
cd cloud-Resume-Challenge/infrastructure/terraform
```

### 2. Initialize Terraform

```bash
terraform init
```

### 3. Configure Variables

Make sure you edit the **variables.tf** file with your specific configuration:

```hcl
domain_name     = "your-domain.com"
aws_region      = "us-east-1"
environment     = "production"
project_name    = "cloud-resume-challenge"
bucket_name     = "your-s3bucket-name"
```

### 4. Review the Plan

```bash
terraform plan
```

### 5. Apply the Configuration

```bash
terraform apply
```

## TIP

Help with formatting

```bash
terraform fmt
```

## Project Structure

```
infrastructure/
├── main.tf                 # Main Terraform configuration
├── variables.tf            # Input variable definitions
├── outputs.tf              # Output value definitions
├── providers.tf            # Provider configurations
```

## Key Resources

| Resource                | Purpose                                |
| ----------------------- | -------------------------------------- |
| CloudFront Distribution | Global CDN for static content delivery |
| S3 Bucket               | Hosts the static resume website        |
| Route 53 Hosted Zone    | DNS management for custom domain       |
| ACM Certificate         | SSL/TLS encryption for HTTPS           |

## Outputs

After successful deployment, Terraform will output:

- `cloudfront_distribution_id`: CloudFront distribution ID
- `cloudfront_domain_name`: CloudFront domain name
- `website_url`: Full URL of the deployed website

## Cost Considerations

Most services used are within AWS Free Tier limits for small-scale applications:

- CloudFront: 1TB data transfer out per month
- Route 53: $0.50 per hosted zone per month (not free tier)

## Maintenance

### Updating Infrastructure

```bash
# Pull latest changes
git pull origin main

# Review changes
terraform plan

# Apply updates
terraform apply
```

### Destroying Infrastructure

```bash
terraform destroy
```

⚠️ **Warning**: This will delete all resources.

## Contributing

This infrastructure is part of the Cloud Resume Challenge. Contributions and suggestions are welcome!

## Resources

- [Cloud Resume Challenge](https://cloudresumechallenge.dev/)
- [Terraform AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [AWS Well-Architected Framework](https://aws.amazon.com/architecture/well-architected/)
