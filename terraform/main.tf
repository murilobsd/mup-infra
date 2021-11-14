provider "aws" {
  region = var.region
}

/*
 * S3 Terraform State
 */
resource "aws_s3_bucket" "terraform_state" {
  bucket = "${var.app}-terraform-state"
  acl    = "private"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

/*
 * DynamoDB Terraform Global Lock
 * NOTE: Not change attribute name and hash_key **EVER**
 */
resource "aws_dynamodb_table" "terraform_locks" {
  name         = "${var.app}-terraform-state-locking"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
