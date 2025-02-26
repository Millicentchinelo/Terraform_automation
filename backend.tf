terraform {
  backend "s3" {
    bucket = "millicentc-tfstate-bucket"
    key    = "millicent/terraform.tfstate"
    region = "us-west-2"
  }
}
