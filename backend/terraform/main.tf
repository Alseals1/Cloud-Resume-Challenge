#DynamoDB
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