module "dev" {
    source = "../Day-10-Module-souce"
    ami = "ami-0f559c3642608c138"
    instance_type = "t3.mico"
    availability_zone = "ap-south-1a"
    name = "Testec2"
  
}