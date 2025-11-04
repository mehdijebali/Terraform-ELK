locals {
  ami-name = var.LD_NAME == "centos" ? "al2023-elk-pkr-*" : "ubuntu-elk-pkr-*"
  elk-sg-tags = {
    Name = var.SG_NAMES[1]
  }
  default-tags = {
    Stack       = "ELK",
    Environment = "Production"
  }
}