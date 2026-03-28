# =============================================
# Step 1: Create IAM Role (with EC2 trust)
# =============================================
resource "aws_iam_role" "ec2_role" {
  name = "ec2-custom-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = { Service = "ec2.amazonaws.com" }
        Action    = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name = "ec2-custom-role"
  }
}

# =============================================
# Step 2: Create Custom IAM Policy
# =============================================
resource "aws_iam_policy" "ec2_custom_policy" {
  name        = "ec2-custom-policy"
  description = "Custom policy with full access to S3, EC2, and CloudWatch"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["s3:*"]          # Full S3 Access
        Resource = "*"
      },
      {
        Effect   = "Allow"
        Action   = ["ec2:*"]         # Full EC2 Access
        Resource = "*"
      },
      {
        Effect   = "Allow"
        Action   = ["cloudwatch:*"]  # Full CloudWatch Access
        Resource = "*"
      },
      {
        Effect   = "Allow"
        Action   = ["iam:*"]         # Full IAM Access
        Resource = "*"
      }
    ]
  })

  tags = {
    Name = "ec2-custom-policy"
  }
}

# =============================================
# Step 3: Attach Custom Policy to IAM Role
# =============================================
resource "aws_iam_role_policy_attachment" "attach_policy" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = aws_iam_policy.ec2_custom_policy.arn
}

# =============================================
# Step 4: Create Instance Profile
# =============================================
resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2-custom-profile"
  role = aws_iam_role.ec2_role.name
}

# =============================================
# Step 5: Create EC2 and Attach IAM Role
# =============================================

resource "aws_instance" "name" {
   ami = "ami-0a14f53a6fe4dfcd1"
   instance_type = "t3.micro"
   iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
   tags = {
     Name ="dev"
   }
}
#