output "dynamodb_table_name" {
  description = "Name Of Dynamodb table"
  value       = aws_dynamodb_table.visit_counter.name
}

output "dynamodn_arn" {
  description = "ARN of Dynamodb table"
  value       = aws_dynamodb_table.visit_counter.arn
}


output "api_endpoint" {
  description = "API Gateway endpoint URL"
  value       = aws_apigatewayv2_api.visitor_api.api_endpoint
}