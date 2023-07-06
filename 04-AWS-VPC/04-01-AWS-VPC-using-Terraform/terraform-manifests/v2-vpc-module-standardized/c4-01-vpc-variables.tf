# VPC Input Variables

# VPC Name
variable "vpc_name" {
  default = "MyVPC"
}

# VPC CIDR BLOCK
variable "vpc_cidr_block" {
  default = "10.60.0.0/16"
}

# VPC Availability Zones
variable "vpc_azs" {
  type = list(string)
  default = ["us-east-1a","us-east-1b"]
}

# VPC Public subnets
variable "vpc_public_subnets" {
  type = list(string)
  default = ["10.60.1.0/24","10.60.2.0/24"]
}

# VPC Private subnets
variable "vpc_private_subnets" {
  type = list(string)
  default = ["10.60.10.0/24","10.60.20.0/24"]
}


# VPC Database Subnets
variable "vpc_database_subnets" {
  type = list(string)
  default = ["10.60.31.0/24", "10.60.32.0/24"]
}

# VPC Create Database subnet Group (True/False)
variable "vpc_create_database_subnet_group" {
  type = bool
  default = true
}

# VPC Create Database subnet Route Table (True/False)
variable "vpc_create_database_subnet_route_table" {
  type = bool
  default = true
}

# VPC Enable NAT Gateway (True/False)
variable "vpc_enable_nat_gateway" {
  type = bool
  default = true
}

# VPC Single NAT Gateway (True/False)
variable "vpc_single_nat_gateway" {
  type = bool
  default = true
}
