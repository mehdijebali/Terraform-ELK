# IAM role for the EC2 instance so SSM can manage it
resource "aws_iam_role" "ec2_ssm_role" {
  name               = "ssm_role"
  assume_role_policy = file("${path.module}/ssm_role.json")
}

# Attach AWS managed policy for SSM agent
resource "aws_iam_role_policy_attachment" "ssm_core" {
  role       = aws_iam_role.ec2_ssm_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

# Instance profile for EC2
resource "aws_iam_instance_profile" "ec2_profile" {
  name = "${var.INSTANCE_NAME}-instance-profile"
  role = aws_iam_role.ec2_ssm_role.name
}
