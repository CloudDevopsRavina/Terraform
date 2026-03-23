# resource "aws_instance" "ec2-instance" {
#     ami = "ami-0f559c3642608c138"
#     instance_type = "t3.small"
#     lifecycle {
#       prevent_destroy = true
#     }
  
# }

#terraform defaut action is 1st destroy and then create but now using below rule 1st create then destory
# resource "aws_instance" "ec2-instance" {
#     ami = "ami-05d2d839d4f73aafb"  # changed AMI from linux to ubuntu
#     instance_type = "t3.small"
#     availability_zone = "ap-south-1b" #chnages AZ from 1a to 1b
#     lifecycle {
#       create_before_destroy = true
#     }
#     tags = {
#       Name = "newinstance"
#     }
  
# }

#igone changes
resource "aws_instance" "ec2-instance" {
    ami = "ami-05d2d839d4f73aafb"  # changed AMI from linux to ubuntu
    instance_type = "t3.small"
    availability_zone = "ap-south-1b" #chnages AZ from 1a to 1b
    lifecycle {
      ignore_changes = [ tags , instance_type]
    }
    tags = {
      Name = "newinstance"
    }
  
}