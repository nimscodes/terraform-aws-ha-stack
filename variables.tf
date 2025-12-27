variable "aws_region" {
  type        = string
  description = "AWS region to deploy into"
  default     = "us-east-1"
}

variable "project_name" {
  type        = string
  description = "Prefix for naming AWS resources"
  default     = "ha-web"
}

variable "key_name" {
  type        = string
  description = "Existing EC2 key pair name to enable SSH (optional but recommended for debugging)"
}
