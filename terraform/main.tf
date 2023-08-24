# terraform自体の設定
terraform {
  backend "s3" {
    bucket = "nuu-playground-s3-state-bucket"
    key    = "terraform.tfstate"
    region = "ap-northeast-1"
  }
}

# AWSリソースを作成・管理する際に使用するプロバイダー
provider "aws" {
  region = "ap-northeast-1"
}

# 共通設定
module "common" {
  source        = "./common"
  env_name      = "dev"
  domain        = "app-dev.nuu-playground.com"
}
