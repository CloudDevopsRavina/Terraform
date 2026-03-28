terraform {
  backend "s3" {
   bucket         = "ravinarathod123-383946777397-ap-south-1-an"
   key            = "day-4/terraform.tfstate"
  region         = "ap-south-1"
  #use_lockfile = true #
  #dynamodb_table = "terraform-lock-table"
    #encrypt        = true

 }
}