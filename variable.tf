variable "AWS_REGION" {
default = "ap-south-1"
}

provider "aws" {
  region     = "us-east-1"
}

variable "AMI_ID" {
    default = ami-0b0ea68c435eb488d
}

variable "PATH_TO_PUBLIC_KEY" {
  description = "Public key path"
  default = "levelup_key.pub"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "levelup_key"
}

variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}