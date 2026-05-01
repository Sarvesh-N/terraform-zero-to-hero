terraform {
  backend "s3" {
    bucket = "mydemoremotebackendbucket"
    key = "sarvesh/terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "loc_files"
  }
}