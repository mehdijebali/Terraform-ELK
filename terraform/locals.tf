locals {
  SG_Name = var.SG_NAMES[1]
}

locals {
  sg_tags = {
    Name = local.SG_Name
  }
}