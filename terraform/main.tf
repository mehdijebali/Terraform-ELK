terraform {
  required_version = ">= 1.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.AWS_REGION
  default_tags {
    tags = local.default-tags
  }
}

data "aws_vpc" "default" {
  default = true
}

resource "aws_eip" "ip" {
  instance = module.instance.instance_id
}

data "aws_ami" "packer_ami" {
  most_recent = true
  owners      = ["self"]

  filter {
    name   = "name"
    values = [local.ami-name]
  }
}
module "ssm-role" {
  source = "github.com/mehdijebali/terraform-modules//ssm-role?ref=v1.0.0"
}
module "instance" {
  source = "github.com/mehdijebali/terraform-modules//instance?ref=v1.0.0"

  SG_VPC_ID             = data.aws_vpc.default.id
  USER_DATA             = module.ssm-role.user_data
  INSTANCE_PROFILE_NAME = module.ssm-role.instance_profile_name
  AMI_ID                = data.aws_ami.packer_ami.id
  INSTANCE_SUBNET_ID    = var.INSTANCE_SUBNET_ID
  INSTANCE_TYPE         = var.INSTANCE_TYPE
  INSTANCE_NAME         = var.INSTANCE_NAME
  AVAILABILITY_ZONE     = var.AVAILABILITY_ZONE

  depends_on = [aws_security_group.allow_elk]
}