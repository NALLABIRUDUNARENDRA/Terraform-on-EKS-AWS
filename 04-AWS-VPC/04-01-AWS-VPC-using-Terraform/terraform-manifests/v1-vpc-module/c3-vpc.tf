# Create VPC Terraform Module
module "VPC" {
  source = "terraform-aws-modules/vpc/aws"
  version = "4.0.1"

 #  VPC Basic Details
  name = "vpc-dev"
  cidr = "10.60.0.0/16"
  azs = ["us-east-1a", "us-east-1b"]
  public_subnets = ["10.60.1.0/24", "10.60.2.0/24"]
  private_subnets = ["10.60.10.0/24", "10.60.20.0/24"]

 # Database Subnets
  create_database_subnet_group = true
  create_database_subnet_route_table= true
  database_subnets    = ["10.60.31.0/24", "10.60.41.0/24"]

 # NAT Gateways - Outbound Communication
  enable_nat_gateway = true
  single_nat_gateway = true

 # VPC DNS Parameters
 enable_dns_hostnames = true
 enable_dns_support = true

 public_subnet_tags = {
    Name = "Public_Subnets"
 }

 private_subnet_tags = {
    Name = "Private_Subnets"
 }

 database_subnet_tags = {
    Name = "DataBase_Subnets"
 }

 tags = {
   Owner = "Nallabirudu Narendra"
   env = "dev"
 }

 vpc_tags = {
   Name = "VPC-Dev"
 }
}

