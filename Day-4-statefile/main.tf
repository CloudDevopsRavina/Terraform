
#creation of IAM role
resource "aws_iam_role" "ec2-role" {
    name = "ec2-custome-role"

    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement =[{
            Effect = "Allow"
            Principal = {Service ="ec2.amazonaws.com"}
            Action ="sts:AssumeRole"
        }]
    })

    tags = {
      Name = "ec2-custome-role"
    }
  
}

#creation of policy

resource "aws_iam_policy" "ec2-policy" {
    name = "iam-policy-cutome"
    policy = jsonencode({
        Version ="2012-17-2012"
        Statement =[
            {
                Effect = "Allow"
                Action =["s3:*"] 
                Resource ="*"
            }


        ]
        
    })

    tags ={
        Name="iam-policy"
    }

    
  
}

#attching policy to iam role

resource "aws_iam_role_policy_attachment" "policy-attachemnt" {
    role = aws_iam_role.ec2-role.name
    policy_arn = aws_iam_policy.ec2-policy.arn
  
}

#ec2 profile
resource "aws_iam_instance_profile" "ec2-profile" {
   role = aws_iam_role.ec2-role.name
  
}

resource "aws_instance" "name" {
   ami = "ami-0a14f53a6fe4dfcd1"
   instance_type = "t3.micro"
   iam_instance_profile = aws_iam_instance_profile.ec2-profile.name
   tags = {
     Name ="dev"
   }
}
