variable "AWS_REGION" {
  default = "us-east-1"
}

variable "AMI_ID" {
  default = "ami-0b0ea68c435eb488d"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "levelup_key.pub"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "levelup_key"
}

variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}

variable "INSTANCE_TYPE" {
  default = "m4.large"
}

variable "AVAILABILITY_ZONE" {
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
  default = "ELK Server"
}

variable "KEY_NAME" {
  default = "tf-ssh-key"
}