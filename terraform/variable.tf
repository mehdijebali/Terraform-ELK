variable "AWS_REGION" {
  type = string
  default = "us-east-1"
}

variable "PATH_TO_PUBLIC_KEY" {
  type = string
  default = "levelup_key.pub"
}

variable "PATH_TO_PRIVATE_KEY" {
  type = string
  default = "levelup_key"
}

variable "INSTANCE_USERNAME" {
  type = string
  default = "ubuntu"
}

variable "INSTANCE_TYPE" {
  type = string
  default = "m4.large"
}

variable "AVAILABILITY_ZONE" {
  type = string
  default = "us-east-1a"
}

variable "SG_NAMES" {
  type    = list(any)
  default = ["allow-levelup-ssh", "allow_elk"]
}

variable "SG_DESCRIPTIONS" {
  type    = list(any)
  default = ["security group that allows ssh connection", "Elasticsearch traffic"]
}

variable "INSTANCE_NAME" {
  type = string
  default = "ELK Server"
}

variable "KEY_NAME" {
  type = string
  default = "tf-ssh-key"
}

variable "LD_NAME" {
  type = string
  default = "centos"
}