provider "aws" {
  region = "us-east-1"
  assume_role {
    role_arn = "arn:aws:iam::363664571315:role/role-workload-Terraform"
  }
}