# Terraformのテンプレートファイルを使ってファイルをレンダリングするためのデータソースを定義
data "template_file" "openapi" {
  template = file("${path.module}/../../openapi/openapi.yml")
  vars = {
    arn_invoke_role                         = "${aws_iam_role.lambda_apigateway_exec_role.arn}"
  }
}

# AWS API Gateway v2のHTTP APIを作成
resource "aws_apigatewayv2_api" "http_api" {
  name          = "http-api"
  protocol_type = "HTTP"
  body          = data.template_file.openapi.rendered     # APIの定義に使用するOpenAPI（Swagger）ファイルの内容を指定
}

# API Gateway v2のステージを作成
resource "aws_apigatewayv2_stage" "api" {
  api_id      = aws_apigatewayv2_api.http_api.id
  name        = "api"
  auto_deploy = true
}
