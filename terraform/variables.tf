variable "aws_region" {
  default = "ap-south-1"
}

variable "ami_id" {
  description = "Ubuntu 20.04 LTS AMI"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  description = "AWS key pair name"
}

variable "private_key_path" {
  description = "Path to your private SSH key"
}
