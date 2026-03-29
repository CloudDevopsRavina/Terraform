module "ec2" {
    source = "./modules/ec2"
    ami = var.ami
    instance_type = var.instance_type
    availability_zone = var.availability_zone
  
}