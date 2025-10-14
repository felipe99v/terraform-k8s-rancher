terraform {
  backend "s3" {
    bucket       = "terraform-k8s-rancher-prod-tfstate"
    key          = "terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}