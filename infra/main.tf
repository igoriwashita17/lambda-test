module "lambda_function" {
  source = "terraform-aws-modules/lambda/aws"

  function_name = var.function_name
  description   = "My awesome lambda function"
  handler       = "index.handler"
  runtime       = "nodejs18.x"

  source_path = "../src"

  tags = {
    Name = "yey-lambda1"
  }
}

resource "aws_lambda_permission" "allow-api-gateway" {
  function_name = "${module.lambda_function.lambda_function_name}"
  statement_id  = "AllowExecutionFromApiGateway"
  action        = "lambda:InvokeFunction"
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${var.apigw_execution_arn}/*/*"
  depends_on    = [module.lambda_function]
}