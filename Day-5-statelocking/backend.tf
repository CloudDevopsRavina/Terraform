terraform {
  backend "s3" {
    bucket = "ravinarathod-383946777397-ap-south-1-an"
    key = "Day-5/terraform.tfstate"
    region = "ap-south-1"
    #use_lockfile = true
    dynamodb_table = "test"
    encrypt = true
  }
}