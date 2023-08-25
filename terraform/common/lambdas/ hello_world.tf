data "archive_file" "hello_world_zip" {
  type        = "zip"
  source_dir  = "${path.module}/../../../python/src/hello_world"
  output_path = "lambda/hello_world.zip"
}

resource "aws_lambda_function" "hello_world" {
  function_name    = "hello_world"
  handler          = "lambda_function.lambda_handler"
  filename         = data.archive_file.hello_world_zip.output_path
  runtime          = local.lambda_runtime
  role             = var.lambda_exec_role
  source_code_hash = data.archive_file.hello_world_zip.output_base64sha256
  architectures    = local.lambda_arch
  memory_size      = local.lambda_memory_size_mid
  timeout          = local.lambda_timeout_max
  depends_on = [
    aws_cloudwatch_log_group.hello_world
  ]
}

resource "aws_cloudwatch_log_group" "hello_world" {
  name              = "/aws/lambda/hello_world"
  retention_in_days = 7
}

output "arn_hello_world" {
  value = aws_lambda_function.hello_world.arn
}

output "function_name_hello_world" {
  value = aws_lambda_function.hello_world.function_name
}
