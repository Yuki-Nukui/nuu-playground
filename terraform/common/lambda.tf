module "lambdas" {
  source                     = "./lambdas"
  lambda_exec_role           = aws_iam_role.nuu_lambda_iam_role.arn
  domain                     = var.domain
}
