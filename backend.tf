terraform {
  backend "s3" {
    bucket = "millicenta-tfstate-bucket"
    key    = "millicent/terraform.tfstate"
    region = "us-west-2"
  }
}
