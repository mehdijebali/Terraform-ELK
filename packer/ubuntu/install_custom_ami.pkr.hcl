
data "amazon-ami" "ubuntu" {
  filters = {
    name                = "ubuntu/images/*ubuntu-xenial-16.04-amd64-server-*"
    root-device-type    = "ebs"
    virtualization-type = "hvm"
  }
  most_recent = true
  owners      = ["099720109477"]
  region      = "us-east-1"
}

source "amazon-ebs" "ubuntu" {
  ami_name      = "ubuntu-elk-pkr-${formatdate("YYYY-MM-DD-hhmmss", timestamp())}"
  instance_type = "m4.large"
  region        = "us-east-1"
  source_ami    = "${data.amazon-ami.ubuntu.id}"
  ssh_username  = "ubuntu"
}

build {
  sources = ["source.amazon-ebs.ubuntu"]

  provisioner "ansible" {
    playbook_file = "./ansible/main.yml"
  }

}
