
#this is 3rd way we can call the name for the instance 
variable "ec2" {
    type = list(string)
    default = [ "dev","test","prod" ]
  
}

resource "aws_instance" "name" {
    ami = "ami-0931307dcdc2a28c9"
    instance_type = "t3.small"
    count=length(var.ec2)
    tags = {
     # Name = "ec2" # this creating both instance with same name as "ec2"  ---1st way
     #Name = "test-${count.index}"  #could see test-0, test-1    ----2nd way
     #other way we can give unique name to instances ---3rd way
     Name = var.ec2[count.index]

    }
  
}