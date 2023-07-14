# AWS Availability Zones DataSource
data "aws_availability_zones" "available" {
#   state = "avabilable"
}

# Create VPC Terraform Module
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "4.0.1"

 #  VPC Basic Details
  name = "${local.name}-${var.vpc_name}"
  cidr = var.vpc_cidr_block
 #   azs = var.vpc_azs
  azs             = data.aws_availability_zones.available.names
  public_subnets  =  var.vpc_public_subnets
  private_subnets = var.vpc_private_subnets
  map_public_ip_on_launch = true           # Enable public IP assignment

 # Database Subnets
  create_database_subnet_group = var.vpc_create_database_subnet_group
  create_database_subnet_route_table= var.vpc_create_database_subnet_route_table
  database_subnets    = var.vpc_database_subnets

 # NAT Gateways - Outbound Communication
  enable_nat_gateway = var.vpc_enable_nat_gateway
  single_nat_gateway = var.vpc_single_nat_gateway

 # VPC DNS Parameters
 enable_dns_hostnames = true
 enable_dns_support = true
 
 # ADDITIONAL TAGS TO SUBNETS
 public_subnet_tags = {
    Name = "Public-Subnets"
    "kubernetes.io/role/elb" = 1
    "kubernetes.io/cluster/${local.eks_cluster_name}" = "shared"
 }

 private_subnet_tags = {
    Name = "Private-Subnets"
    "kubernetes.io/role/elb" = 1
    "kubernetes.io/cluster/${local.eks_cluster_name}" = "shared"
 }

 database_subnet_tags = {
    Name = "Private-DataBase-Subnets"
 }

 tags = local.common_tags
 vpc_tags = local.common_tags
}