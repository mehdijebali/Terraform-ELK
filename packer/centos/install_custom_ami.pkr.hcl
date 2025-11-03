packer {
  required_version = ">= 1.14.0"

  required_plugins {
    amazon = {
      source  = "github.com/hashicorp/amazon"
      version = ">= 1.2.0"
    }
    ansible = {
      source  = "github.com/hashicorp/ansible"
      version = ">= 1.1.0"
    }
  }
}
  
source "amazon-ebs" "al2023" {
  ami_name      = "al2023-elk-pkr-${formatdate("YYYY-MM-DD-hh.mm.ss", timestamp())}"
  instance_type = "m4.large"
  region        = "us-east-1"
  ssh_username  = "ec2-user"
  source_ami_filter {
  filters = {
    name                = "al2023-ami-*-x86_64"
    architecture        = "x86_64"
    root-device-type    = "ebs"
    virtualization-type = "hvm"
  }
  owners      = ["137112412989"] 
  most_recent = true
  }

  launch_block_device_mappings {
    device_name = "/dev/xvda"
    volume_size = 20
    volume_type = "gp3"
    delete_on_termination = true
  }
}

build {
  sources = ["source.amazon-ebs.al2023"]
  provisioner "ansible" {
    playbook_file = "./ansible/main.yml"
  }
}
