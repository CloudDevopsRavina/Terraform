module "dev" {

    source = "../Day-12-hardcoding-s3-resouce-block-ec2"
    ami = "ami-39087087079"
    instance_type = "t3.small"
  
}