variable "AWS_REGION" {
  type = string
  description = "The region where resources are deployed"
  default = "us-east-1"
}

variable "PATH_TO_PUBLIC_KEY" {
  type = string
  description = "Path to SSH public key"
  default = "levelup_key.pub"
}

variable "PATH_TO_PRIVATE_KEY" {
  type = string
  description = "Path to SSH private key"
  default = "levelup_key"
}

variable "INSTANCE_USERNAME" {
  type = string
  description = "AWS instance username used for SSH connection"
  default = "ubuntu"
}

variable "INSTANCE_TYPE" {
  type = string
  description = "AWS Instance type"
  default = "m4.large"
}

variable "AVAILABILITY_ZONE" {
  type = string
  description = "AWS AZ where ELK instance is deployed"
  default = "us-east-1a"
}

variable "SG_NAMES" {
  type    = list(any)
  description = "Security Group names of ELK instance"
  default = ["allow-levelup-ssh", "allow_elk"]
}

variable "SG_DESCRIPTIONS" {
  type    = list(any)
  description = "SG descriptions"
  default = ["security group that allows ssh connection", "Elasticsearch traffic"]
}

variable "INSTANCE_NAME" {
  type = string
  description = "The name of EC2 instance"
  default = "ELK Server"
}

variable "KEY_NAME" {
  type = string
  description = "SSH key name"
  default = "tf-ssh-key"
}

variable "LD_NAME" {
  type = string
  description = "Linux distribution"
  default = "centos"
}