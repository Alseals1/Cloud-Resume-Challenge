#DynamoDB
resource "aws_dynamodb_table" "visit_counter" {
  name         = "${var.project_name}-visit-counter"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "counter_id"

  attribute {
    name = "counter_id"
    type = "S"
  }

  server_side_encryption {
    enabled = true
  }

  tags = {
    Name = "Visit Counter Table"
  }
}

resource "aws_lambda_function" "visitor_counter" {
  function_name = "${var.project_name}-visitor-counter"
  role          = aws_iam_role.lambda_exec.arn
  handler       = "visitor_counter.lambda_handler"
  runtime       = "python3.9"
  filename      = "${path.module}/../lambda/visitor_counter.zip"

  tags = {
    Name = "Visitor Counter Lambda"
  }
}

resource "aws_iam_role" "lambda_exec" {
  name = "${var.project_name}-lambda-exec-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Name = "Lambda Execution Role"
  }
}

resource "aws_iam_role_policy" "lambda_policy" {
  name = "lambda-dynamodb-policy"
  role = aws_iam_role.lambda_exec.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "dynamodb:UpdateItem",
          "dynamodb:GetItem",
          "dynamodb:PutItem"
        ]
        Effect   = "Allow"
        Resource = aws_dynamodb_table.visit_counter.arn
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_basic_attach" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = data.aws_iam_policy.lambda_basic_execution.arn 
}

data "aws_iam_policy" "lambda_basic_execution" {
  name = "AWSLambdaBasicExecutionRole"
}