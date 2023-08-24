locals {
  capacity_units_low            = 1
  capacity_units_mid            = 5
  capacity_units_high           = 10
  capacity_units_max            = 50
  capacity_auto_scale_used_rate = 70
}

# 個々のテーブルを作成
# アトミックカウンタ
resource "aws_dynamodb_table" "atomic_counters" {
  name           = "atomic_counters"
  billing_mode   = "PROVISIONED"              # プロビジョンド課金モード
  read_capacity  = local.capacity_units_mid
  write_capacity = local.capacity_units_mid
  hash_key       = "key"                      # テーブルのハッシュキー（パーティションキー）を指定

  attribute {       # "key" 属性を "S" 型（文字列）として定義
    name = "key"
    type = "S"
  }
}

# インポートデータログ
resource "aws_dynamodb_table" "import_data_logs" {
  name           = "import_data_logs"
  billing_mode   = "PROVISIONED"
  read_capacity  = local.capacity_units_low
  write_capacity = local.capacity_units_low
  hash_key       = "name"

  attribute {
    name = "name"
    type = "S"
  }
}
