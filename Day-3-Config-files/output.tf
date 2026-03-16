output "publicip" {
    #value = aws_instance.dev.public_ip
    value= aws_instance.dev[*].public_ip
  
}

output "privateip" {
    #value = aws_instance.dev.private_ip
    value= aws_instance.dev[*].private_ip
  
}