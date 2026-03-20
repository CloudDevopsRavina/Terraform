provider "aws" {
    
  
}

resource "aws_instance" "ec2-server" {
    ami = "ami-0a14f53a6fe4dfcd1"
    instance_type = "t3.micro"
    tags = {
      Name = "ec2-server"
    }
  
}