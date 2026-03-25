resource "aws_subnet" "public" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = "10.0.0.0/25"
   #depends_on = [ aws_vpc.vpc] #  this means once vpc create then only subnet will get created
  
}

resource "aws_vpc" "vpc" {
    cidr_block = "10.0.0.0/24"
    tags = {
      Name = "project_vpc"
    }
    depends_on = [ aws_subnet.public ] # this vpc get create after subnet create
    #we recevied error because without vpc subnet won't create " Error: Cycle: aws_vpc.vpc, aws_subnet.public"
  
}