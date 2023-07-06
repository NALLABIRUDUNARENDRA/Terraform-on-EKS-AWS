variable "aws_region" {
  type = string
  default = "us-east-1"
}

variable "instance_type" {
  type = string
  default = "t2.nano"
}

variable "key_name" {
  type = string
  default = "terraform2023"
}
