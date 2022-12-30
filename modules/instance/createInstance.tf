
resource "aws_key_pair" "levelup_key" {
    key_name = var.KEY_NAME
    public_key = file(var.PATH_TO_PUBLIC_KEY)
}

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

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = {
    Name = "${var.SG_NAME}"
  }
}

resource "aws_instance" "MyFirstInstnace" {
  ami           = var.AMI_ID
  instance_type = var.INSTANCE_TYPE
  key_name      = aws_key_pair.levelup_key.key_name
  availability_zone = var.AVAILABILITY_ZONE
  vpc_security_group_ids = var.VPC_SECURITY_GROUP_IDS
  
  tags = {
    Name = "${var.INSTANCE_NAME}"
  }

  provisioner "file" {
  source = "elasticsearch.yml"
  destination = "/tmp/elasticsearch.yml"
  }

  provisioner "file" {
  source = "kibana.yml"
  destination = "/tmp/kibana.yml"
  }

  provisioner "file" {
  source = "apache-01.conf"
  destination = "/tmp/apache-01.conf"
  }

  provisioner "file" {
    source = "installELK.sh"
    destination = "/tmp/installELK.sh"
    }

  provisioner "remote-exec" {
  inline = [
    "chmod +x    /tmp/installELK.sh",
    "sudo sed -i -e 's/\r$//' /tmp/installELK.sh",  # Remove the spurious CR characters.
    "sudo /tmp/installELK.sh",
    ]
  }

  connection {
    host        = coalesce(self.public_ip, self.private_ip)
    type        = "ssh"
    user        = var.INSTANCE_USERNAME
    private_key = file(var.PATH_TO_PRIVATE_KEY)
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
