terraform {
  backend "s3" {
    bucket         = "practical-devops-tfstate"
    key            = "state/terraform.tfstate"
    region         = "us-east-1"
    # dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}