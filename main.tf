# main.tf

provider "aws" {
  region = "ap-southeast-1" 
}

resource "aws_lambda_function" "example" {
  function_name = "return_details"
  runtime        = "python3.12"
  role           = data.aws_iam_role.existing_role.arn
  handler        = "lambda_function.lambda_function.return_details"
  source_code_hash = filebase64sha256("lambda_function.zip")
  filename         = "lambda_function.zip"
  publish          = true
}

# Reference to the existing IAM role
data "aws_iam_role" "existing_role" {
  name = "govtech-assessment"  # Use your existing IAM role name
}