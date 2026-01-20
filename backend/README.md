# Cloud Resume Challenge — Backend

This is the serverless backend for the Cloud Resume Challenge. It tracks website visitors using AWS Lambda, DynamoDB, and API Gateway. Everything is deployed and managed with Terraform.

## Architecture

The flow is simple:

1. Your resume website calls the `/visits` endpoint
2. API Gateway routes the request to a Lambda function
3. Lambda extracts your IP, checks if you're a new visitor, and updates the count
4. DynamoDB stores the visitor data
5. The count is returned and displayed on your site

**Components:**

- **Lambda** - Handles the visitor counting logic
- **DynamoDB** - Stores visitor data and the total count
- **API Gateway** - Exposes the HTTP endpoint
- **Terraform** - Automates the infrastructure setup

![Architecture Diagram](/frontend/infrastructure/assets/cloudResumeDiagram.png)

## Project Structure

```
backend/
├── lambda/
│   ├── visitor_counter.py      # Main Lambda function code
│   └── visitor_counter.zip     # Zipped code for deployment
└── terraform/
    ├── main.tf                 # DynamoDB, Lambda, and API Gateway setup
    ├── variables.tf            # Input variables
    ├── outputs.tf              # Output values
    └── provider.tf             # AWS provider config
```

---

## Setup Instructions

### 1. Prerequisites

- AWS account with permissions for:
  - Lambda
  - DynamoDB
  - API Gateway
  - IAM
- [Terraform](https://developer.hashicorp.com/terraform/downloads) installed
- AWS CLI configured (`aws configure`)

## Getting Started

### Prerequisites

You'll need:

- An AWS account with credentials configured locally
- Terraform installed
- The AWS CLI set up and authenticated

### Deploying the Backend

1. Navigate to the Terraform directory

   ```bash
   cd backend/terraform
   ```

2. Initialize Terraform

   ```bash
   terraform init
   ```

3. Review what Terraform will create

   ```bash
   terraform plan
   ```

4. Apply the configuration

   ```bash
   terraform apply
   ```

   Confirm with `yes` when prompted. This will create:
   - A DynamoDB table to store visitor data
   - A Lambda function to handle the counting logic
   - An IAM role with the necessary permissions
   - An API Gateway endpoint to expose the Lambda function

5. After deployment, Terraform will output your API endpoint URL. Save this for the frontend.

### Updating the Lambda Code

If you modify `visitor_counter.py`:

```bash
cd backend/lambda
zip visitor_counter.zip visitor_counter.py
cd ../terraform
terraform apply
```

This repackages and redeploys the function.

---

## Testing the API

### Test from AWS Console

1. Go to **Lambda - your function**
2. Create a **Test Event** with this JSON:
   ```json
   {}
   ```
3. Run the test.
4. You should get a 200 response like:
   ```json
   { "visits": 1 }
   ```

### Test from Terminal

After Terraform deploys, get the API endpoint URL from the Terraform output:

```bash
curl Your_APIGATEWAY_URL/visits
```

Expected response:

```json
{ "visits": 5, "unique": true }
```

The response includes:

- `visits` - Total visitor count
- `unique` - Whether this is a new unique visitor

---

## Cleaning Up

To remove all AWS resources created by Terraform:

```bash
cd backend/terraform
terraform destroy
```

Confirm with `yes`. This will delete the DynamoDB table, Lambda function, API Gateway, and IAM role.

---

## How It Works

The Lambda function:

1. Extracts the visitor's IP address from the request
2. Hashes it with SHA-256 for privacy
3. Checks if they've visited in the last 24 hours
4. Increments the visitor count if they're new
5. Returns the total count and whether they're a new visitor

The data is stored in DynamoDB with:

- `counter_id = "total"` - The main counter record
- `counter_id = "ip#<hashed_ip>"` - Visitor tracking records (24-hour TTL conceptually)

## Cost Optimization

DynamoDB uses pay-per-request billing, so you only pay for the requests you actually make. With a low-traffic site, this is typically less than a dollar per month.

## Troubleshooting

**Lambda returns 500 error:**

- Check CloudWatch logs: `aws logs tail /aws/lambda/Cloud-Resume-Challenge-visitor-counter --follow`
- Verify the DynamoDB table exists and is active
- Check that the Lambda IAM role has DynamoDB permissions

**Terraform apply fails:**

- Run `terraform validate` to check syntax
- Verify AWS credentials: `aws sts get-caller-identity`
- Check the error message for permission or resource issues
