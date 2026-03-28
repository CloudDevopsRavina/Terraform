# #ste1:creation of IAM role

# resource "aws_iam_role" "ec2-role" {
#     name = "ec2_custome_role"
#     assume_role_policy = jsonencode({
#         Version = "2012-10-17"
#         Statement = [{
#             Effect = "Allow"
#             Principal = {Service:"ec2.amazonaws.com"}
#             Action = "sts:AssumeRole"
#         }]
#     })
#    tags = {
#      Name = "IAM-ROLE"
#    }
# }

# #Step2 creating a custome policy

# resource "aws_iam_policy" "ec2-custom-policy" {
#     name = "ec2-custom-policy"
#     policy = jsonencode({
#         Version = "2012-10-17"
#         Statement = [
#             {
#                 Effect = "Allow"
#                 Action = ["s3:*"]
#                 Resource = "*"
#             }
#         ]
#     })
#     tags = {
#       Name = "Ec2-custome-policy"
#     }
  
# }

# #step3 attching poilicy to IAM

# resource "aws_iam_role_policy_attachment" "ec2-policy-attachment" {
#     role = aws_iam_role.ec2-role.name
#     policy_arn = aws_iam_policy.ec2-custom-policy.arn
  
# }
# #step4 creating Profile for ec2 attchment
# resource "aws_iam_instance_profile" "ec2-profile" {
#     name ="ec2-profile-IAM"
#     role = aws_iam_role.ec2-role.name
    
  
# }

# #step4 creation of resouce and attch ec2
# resource "aws_instance" "ec2" {
#     ami = "ami-0a14f53a6fe4dfcd1"
#     instance_type = "t3.small"
#     iam_instance_profile = aws_iam_instance_profile.ec2-profile.name
#     tags = {
#       Name = "cust-ec2-terraform"
#     }
  
# }

 resource "aws_instance" "ec2" {
   ami = "ami-0a14f53a6fe4dfcd1"
   instance_type = "t3.small"
   tags = {
     Name = "cust-ec2-terraform"
   }
 }

