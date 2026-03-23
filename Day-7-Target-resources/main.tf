resource "aws_instance" "ec2-instance" {
    ami = "ami-05d2d839d4f73aafb"  # changed AMI from linux to ubuntu
    instance_type = "t3.small"
   
    tags = {
      Name = "newinstance"
    }
  
}