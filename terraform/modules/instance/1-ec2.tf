
#Security Group for levelupvpc
resource "aws_security_group" "instance-sg" {
  vpc_id      = var.SG_VPC_ID
  name        = var.SG_NAME
  description = var.SG_DESCRIPTION

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.SG_NAME}"
  }
}

# user data: ensure SSM agent installed & running (covers edge-cases)
data "template_file" "user_data" {
  template = <<-EOF
              #!/bin/bash
              # ensure package updates and ssm agent present
              if command -v yum >/dev/null 2>&1; then
                yum update -y
                yum install -y amazon-ssm-agent || true
                systemctl enable amazon-ssm-agent || true
                systemctl start amazon-ssm-agent || true
              elif command -v apt-get >/dev/null 2>&1; then
                apt-get update -y
                apt-get install -y snapd || true
                snap install amazon-ssm-agent --classic || true
                systemctl enable amazon-ssm-agent || true
                systemctl start amazon-ssm-agent || true
              fi
              EOF
}

resource "aws_instance" "MyFirstInstnace" {
  ami                    = var.AMI_ID
  instance_type          = var.INSTANCE_TYPE
  availability_zone      = var.AVAILABILITY_ZONE
  iam_instance_profile   = aws_iam_instance_profile.ec2_profile.name
  vpc_security_group_ids = [aws_security_group.instance-sg.id]
  user_data              = data.template_file.user_data.rendered
  monitoring             = true
  metadata_options {
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
  }

  tags = {
    Name = "${var.INSTANCE_NAME}"
  }

}
