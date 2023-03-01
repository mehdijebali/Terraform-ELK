data "amazon-ami" "centos" {
  filters = {
    name                = "amzn2-ami-hvm-2.0.*-gp2"
    root-device-type    = "ebs"
    virtualization-type = "hvm"
  }
  most_recent = true
  owners      = ["amazon"]
  region      = "us-east-1"
}

source "amazon-ebs" "centos" {
  ami_name      = "centos-elk-pkr-${formatdate("YYYY-MM-DD-hh.mm.ss", timestamp())}"
  instance_type = "m4.large"
  region        = "us-east-1"
  source_ami    = "${data.amazon-ami.centos.id}"
  ssh_username  = "ec2-user"
}

build {
  sources = ["source.amazon-ebs.centos"]

  provisioner "ansible" {
    playbook_file = "./ansible/main.yml"
  }

}
