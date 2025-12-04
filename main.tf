provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "pipeline_bucket" {
  bucket = "${var.bucket_name}"
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.pipeline_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}
