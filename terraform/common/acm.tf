# AWS Certificate Manager にて SSL/TLS証明書を作成
resource "aws_acm_certificate" "cert" {
  provider          = aws.virginia        # CloudFrontで使うならバージニア北部
  domain_name       = var.domain
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}
