variable "lambda_exec_role" {}
variable "domain" {}

locals {
  lambda_runtime         = "python3.9"
  lambda_arch            = ["arm64"]
  lambda_timeout         = 60
  lambda_timeout_max     = 900
  lambda_memory_size     = 128
  lambda_memory_size_mid = 1536
  lambda_memory_size_max = 10240
}
