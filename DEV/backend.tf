#### Creating resources S3 bucket and TB DynamoDB ####

resource "aws_s3_bucket" "terraform_state_bucket" {
  bucket = "project-teste-terraform-state-s3"

  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_s3_bucket_versioning" "terraform_state_versioning" {
  bucket = aws_s3_bucket.terraform_state_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "project-teste-dev-tf-lock-dynamodb"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

#### Config Backend to S3 Bucket ####

terraform {
  backend "s3" {
    bucket         = "project-teste-terraform-state-s3"
    key            = "dev/terraform.tfstate"
    region         = "eu-central-1"
    encrypt        = true
    dynamodb_table = "project-teste-dev-tf-lock-dynamodb"
  }
}