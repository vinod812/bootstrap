terraform {
  backend "s3" {
    bucket = "terraform-state-vv1"
    key    = "statefile/demo/terraform.tfstate"
    region = "us-east-2"
  }

}