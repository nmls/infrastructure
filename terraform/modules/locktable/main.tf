resource "aws_s3_bucket" "state" {
  bucket = "${var.vendor}-${var.project}-terraform-${var.env_full}"
  acl = "private"
}

resource "aws_dynamodb_table" "terraform_statelock" {
  name = "${var.project}-terraform-statelock-${var.env_full}"
  read_capacity = 10
  write_capacity = 10
  hash_key = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}
