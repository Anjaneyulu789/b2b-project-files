# IAM role for Lambda execution
resource "aws_iam_role" "lambda_role" {
  name = "lambda_execution_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Attach IAM policy for Lambda to access S3, CloudWatch logs, etc.
resource "aws_iam_role_policy_attachment" "lambda_policy_attachment" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# Lambda function
resource "aws_lambda_function" "B2b_lambda" {
  function_name    = "B2b-lambda-function"
  handler          = "index.handler"
  runtime          = "nodejs20.x"
  filename         = "/home/ec2-user/terraform/lambda/example-lambda-function.zip"  # Local path to the Lambda function zip file
  source_code_hash = filebase64sha256("/home/ec2-user/terraform/lambda/example-lambda-function.zip")
  
  role             = aws_iam_role.lambda_role.arn
  
  # Environment variables for Lambda function
  environment {
    variables = {
      ENV_VAR_KEY = "value"
    }
  }
}

along with this file we want zip file like this "example-lambda-function.zip"