resource "aws_instance" "ec2-instance" {
    ami = "ami-0f559c3642608c138"
    instance_type = "t3.small"
    availability_zone = "ap-south-1a"
    tags = {
      Name = "Ec2instance"
    }
    user_data = file("test.sh")
  
}