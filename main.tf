provider "aws" {
  region = var.AWS_REGION
}


provisioner "file" {
  source      = "elasticsearch.yml"
  destination = "/tmp/elasticsearch.yml"
}
provisioner "file" {
  source      = "kibana.yml"
  destination = "/tmp/kibana.yml"
}
provisioner "file" {
  source      = "apache-01.conf"
  destination = "/tmp/apache-01.conf"
}
provisioner "file" {
  source      = "installELK.sh"
  destination = "/tmp/installELK.sh"
}
provisioner "remote-exec" {
  inline = [
    "chmod +x    /tmp/installELK.sh",
    "sudo sed -i -e 's/\r$//' /tmp/installELK.sh", # Remove the spurious CR characters.
    "sudo /tmp/installELK.sh",
  ]
}
connection {
  host        = coalesce(self.public_ip, self.private_ip)
  type        = "ssh"
  user        = var.INSTANCE_USERNAME
  private_key = file(var.PATH_TO_PRIVATE_KEY)
}


resource "aws_eip" "ip" {
  instance = aws_instance.MyFirstInstnace.id
}

output "public_ip" {
  value = aws_instance.MyFirstInstnace.public_ip
}
