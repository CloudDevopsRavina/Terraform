resource "aws_instance" "ec2-instance" {
   ami =var.ami
   instance_type = var.instance_type
   tags = {
     Name = "ec2-instance"
   }
  
}


resource "aws_s3_bucket" "s3-bucket" {
    bucket = "ravianarathod"
  
}