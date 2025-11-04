
#Security Group for levelupvpc
resource "aws_security_group" "allow-levelup-ssh" {
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

resource "aws_instance" "MyFirstInstnace" {
  ami                    = var.AMI_ID
  instance_type          = var.INSTANCE_TYPE
  availability_zone      = var.AVAILABILITY_ZONE
  vpc_security_group_ids = var.VPC_SECURITY_GROUP_IDS
  monitoring             = true
  metadata_options {
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
  }

  tags = {
    Name = "${var.INSTANCE_NAME}"
  }
}

output "public_ip" {
  value = aws_instance.MyFirstInstnace.public_ip
}

output "private_ip" {
  value = aws_instance.MyFirstInstnace.private_ip
}

output "instance_id" {
  value = aws_instance.MyFirstInstnace.id
}

output "instance_ssh_sg_id" {
  value = aws_security_group.allow-levelup-ssh.id
}
