# ==============================================
# terraform/s3.tf
# ==============================================
# Terraform State Bucket (for backend)
resource "aws_s3_bucket" "terraform_state" {
  bucket = "${var.project_name}-terraform-state-${random_id.suffix.hex}"

  tags = {
    Name    = "Terraform State Storage"
    Purpose = "Store Terraform state files"
  }
}

resource "aws_s3_bucket_versioning" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# EV Data Bucket (for your CSV files)
resource "aws_s3_bucket" "ev_data" {
  bucket = "${var.project_name}-data-${random_id.suffix.hex}"

  tags = {
    Name    = "EV Dataset Storage"
    Purpose = "Store CSV and processed data"
  }
}

resource "aws_s3_bucket_versioning" "ev_data" {
  bucket = aws_s3_bucket.ev_data.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "ev_data" {
  bucket = aws_s3_bucket.ev_data.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "ev_data" {
  bucket = aws_s3_bucket.ev_data.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}