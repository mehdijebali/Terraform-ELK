#Module Outputs
output "instance_id" {
  value = aws_instance.MyFirstInstnace.id
}

output "ec2_role_name" {
  value = aws_iam_role.ec2_ssm_role.name
}

output "security_group_id" {
  value = aws_security_group.instance-sg.id
}