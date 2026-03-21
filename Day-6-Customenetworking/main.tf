#Creattion of VPC
resource "aws_vpc" "my-vpc" {
    cidr_block = "10.0.0.0/24"
    tags = {
      Name ="project-vpc"
    }
  
}

#Creation of subnet
resource "aws_subnet" "public-subnet" {
    vpc_id = aws_vpc.my-vpc.id
    cidr_block = "10.0.0.0/25"
    availability_zone = "ap-south-1a"
    tags = {
      Name = "subnet-pub"
    }
  
}

#private subnet
resource "aws_subnet" "private-subnet" {
    vpc_id = aws_vpc.my-vpc.id
    cidr_block = "10.0.0.128/25"
    availability_zone = "ap-south-1b"
    tags = {
      Name = "subnet-pvt"
    }
  
}

#creation of IGW
resource "aws_internet_gateway" "my-igw" {
    vpc_id = aws_vpc.my-vpc.id
    tags = {
      Name = "IGW"
    }
  
}

#Creation route table
resource "aws_route_table" "pub_rt" {
    vpc_id = aws_vpc.my-vpc.id
    route {
        cidr_block="0.0.0.0/0"
        gateway_id = aws_internet_gateway.my-igw.id
    }
  tags = {
    Name = "pub_rt"
  }
}

#subnet association
resource "aws_route_table_association" "association-subnet" {
    subnet_id = aws_subnet.public-subnet.id
    route_table_id = aws_route_table.pub_rt.id
  
}

#EIP creation
resource "aws_eip" "nat-eip" {
    domain = "vpc"
    tags = {
      Name = "nat-eip"
    }
  
}

#NAT Creation

resource "aws_nat_gateway" "NAT" {
    allocation_id = aws_eip.nat-eip.id
    subnet_id = aws_subnet.public-subnet.id
    tags = {
      Name = "nat"
    }
  
}

#Creation of pvt routetable
resource "aws_route_table" "pvt_rt" {
    vpc_id = aws_vpc.my-vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.NAT.id
    }
    tags = {
      Name = "pvt_rt"
    }
  
}

resource "aws_route_table_association" "pvt_association-sub" {
    subnet_id = aws_subnet.private-subnet.id
    route_table_id = aws_route_table.pvt_rt.id
  
}

