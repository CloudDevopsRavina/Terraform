
#this is 3rd way we can call the name for the instance 
variable "ec2" {
    type = list(string)
    default = [ "dev","prod" ] #removed test and applied terraform could see test instance only deleted
    #previuslly when we are using count for deleteing it was not good , it was delete index based and renaming it
  
}

resource "aws_instance" "name" {
    ami = "ami-0931307dcdc2a28c9"
    instance_type = "t3.small"
    for_each = toset(var.ec2)
    tags = {
     Name = each.value

    }
  
}