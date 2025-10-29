# Cloud Resume Challenge — Backend

This backend powers the **Cloud Resume Challenge** project by handling a visitor counter through **AWS Lambda**, **DynamoDB**, and **API Gateway**, all deployed via **Terraform**.

---

## Overview

### Architecture
Browser - API Gateway - Lambda - DynamoDB

- **DynamoDB** — stores the website visitor count.  
- **Lambda** — updates and reads the count.  
- **API Gateway** — exposes an HTTP endpoint for the frontend to call.  
- **Terraform** — manages and deploys all resources as Infrastructure as Code.

---

## File Structure
```
backend/
   lambda/
      visitor_counter.py
      visitor_counter.zip
   terraform/
      main.tf
      variables.tf
      outputs.tf
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

---

### 2. Deploy the Infrastructure

1. **Navigate to the Terraform directory**
   ```bash
   cd backend/terraform
   ```

2. **Initialize Terraform**
   ```bash
   terraform init
   ```

3. **Validate the config**
   ```bash
   terraform validate
   ```

4. **Apply the config**
   ```bash
   terraform apply
   ```

   Type `yes` when prompted.

Terraform will:
- Create a DynamoDB table  
- Create a Lambda function  
- Create an IAM role and policy  
- Connect Lambda to API Gateway  

---

### 3. Zip and Update the Lambda Code
If you change the Python file:
```bash
cd backend/lambda
zip visitor_counter.zip visitor_counter.py
cd ../terraform
terraform apply
```

This redeploys your updated function.

---

## Testing

### Test from AWS Console
1. Go to **Lambda - your function**  
2. Create a **Test Event** with this JSON:
   ```json
   {}
   ```
3. Run the test.  
4. You should get a 200 response like:
   ```json
   {"visits": 1}
   ```

### Test from Terminal
After Terraform deploys, find the API URL output or from the AWS Console.  
Example:
```bash
curl https://xyz123.execute-api.us-east-1.amazonaws.com/dev/visits
```

Expected response:
```json
{"visits": 4}
```

## Cleanup

Again to remove all created AWS resources:
```bash
cd backend/terraform
terraform destroy
```
Confirm with `yes`.

---

## Notes

- DynamoDB table uses **PAY_PER_REQUEST** billing.
- The Lambda increments a single record (`counter_id = "site_visits"`).
- You can extend it later to support both **GET** (read count) and **POST** (increment) requests.