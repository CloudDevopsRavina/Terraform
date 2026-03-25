resource "aws_instance" "name" {
    ami = ""
    instance_type = ""
    availability_zone = "ap-south-1a"
    tags = {
      Name = "Ravina"
    }
  
}

resource "aws_s3_bucket" "bucket" {
    bucket = "ravinarathod"
    tags = {
      Name = "jaishreeram"
    }
}