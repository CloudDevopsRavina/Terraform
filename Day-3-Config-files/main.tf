resource "aws_instance" "dev" {
    ami = var.ami-id
    instance_type = var.instance_type
   # count = 2 #if we have count and want to print IP then in output.tf need to add aws_instance.dev[count.index]
  
}