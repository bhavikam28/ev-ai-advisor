# ==============================================
# terraform/outputs.tf
# ==============================================
output "state_bucket_name" {
  description = "Copy this bucket name for backend configuration"
  value       = aws_s3_bucket.terraform_state.id
}

output "data_bucket_name" {
  description = "Bucket name for uploading CSV files"
  value       = aws_s3_bucket.ev_data.id
}