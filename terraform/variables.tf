# ==============================================
# terraform/variables.tf
# ==============================================
variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "ev-ai-advisor"
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}
