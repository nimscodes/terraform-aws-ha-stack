terraform {
  backend "s3" {
    bucket         = "ha-web-tfstate-rs"
    key            = "terraform-aws-ha-stack/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
