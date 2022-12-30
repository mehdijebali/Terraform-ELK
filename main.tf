provider "aws" {
  region     = var.AWS_REGION
}

resource "aws_eip" "ip" {
  instance = module.instance.instance_id
}

module "instance" {
  source = "./modules/instance"

  KEY_NAME           = var.KEY_NAME
  AVAILABILITY_ZONE  = var.AVAILABILITY_ZONE
  PATH_TO_PUBLIC_KEY = var.PATH_TO_PUBLIC_KEY
  SG_VPC_ID          = module.network.vpc_id
  SG_NAME            = var.SG_NAMES[0]
  SG_DESCRIPTION     = var.SG_DESCRIPTIONS[0]
  AMI_ID             = var.AMI_ID
  INSTANCE_TYPE      = var.INSTANCE_TYPE
  INSTANCE_NAME      = var.INSTANCE_NAME
  INSTANCE_USERNAME  = var.INSTANCE_USERNAME
  VPC_SECURITY_GROUP_IDS = [module.instance.instance_ssh_sg_id, aws_security_group.allow_elk.id]

  depends_on = [aws_security_group.allow_elk]
}