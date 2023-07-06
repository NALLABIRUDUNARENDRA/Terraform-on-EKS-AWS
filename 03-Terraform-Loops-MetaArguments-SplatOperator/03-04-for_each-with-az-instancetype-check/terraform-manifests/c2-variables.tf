variable "aws_region" {
  type = string
  default = "us-east-1"
}

variable "instance_type" {
  type = string
  default = "t3.micro"
}

variable "key_name" {
  type = string
  default = "Terraform On EKS-AWS"
}

variable "instance_type_list" {
  type = list(string)
  default = ["t3.nano","t3.small","t3.large"]
}

variable "instance_type_map" {
  type = map(string)
  default = {
    "dev" = "t3.nano"
    "qa" = "t3.small"
    "prod" = "t3.large"
  }
}
