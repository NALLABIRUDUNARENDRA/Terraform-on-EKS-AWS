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
  default = "Terraform On EKS-AWS"
}

variable "instance_type_list" {
  type = list(string)
  default = ["t2.nano","t2.small","t2.large"]
}

variable "instance_type_map" {
  type = map(string)
  default = {
    "dev" = "t2.nano"
    "qa" = "t2.small"
    "prod" = "t2.large"
  }
}
