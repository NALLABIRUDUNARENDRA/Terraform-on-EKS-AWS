# VPC Variables
vpc_name = "myvpc"
vpc_cidr_block = "10.60.0.0/16"
vpc_availability_zones = ["us-east-1a", "us-east-1b"]
vpc_public_subnets = ["10.60.1.0/24", "10.60.2.0/24"]
vpc_private_subnets = ["10.60.10.0/24", "10.60.20.0/24"]
vpc_database_subnets= ["10.60.31.0/24", "10.60.32.0/24"]
vpc_create_database_subnet_group = true 
vpc_create_database_subnet_route_table = true   
vpc_enable_nat_gateway = true  
vpc_single_nat_gateway = true