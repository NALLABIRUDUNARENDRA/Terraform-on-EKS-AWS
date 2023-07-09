# AWS EC2 INSTANCE TERRAFORM VARIABLES
variable "instance_type" {
  default = "t3.micro"
}


# AWS EC2 INSTANCE KEY PAIR
variable "instance_keypair" {
  default = "Terraform-on-EKS-AWS"
}