module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.13.0"

  # VPC Basic Details
  #vpc_name = "vpc-dev"                         # Use 'vpc_name' instead of 'name'
  cidr     = "10.0.0.0/16"                     # 'cidr' is valid

  azs                 = ["us-east-1a", "us-east-1b"]
  private_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets      = ["10.0.101.0/24", "10.0.102.0/24"]

  # Database Subnets
  database_subnets    = ["10.0.151.0/24", "10.0.152.0/24"]
  create_database_subnet_group = true
  create_database_subnet_route_table= true
  create_database_nat_gateway_route = false      # Adjust argument for creating NAT gateway route
    # Assign a value to 'database_subnet_group_name' and 'name'
  database_subnet_group_name = "my-db-subnet-group"
  name                       = "vpc-dev"

  # NAT Gateways - Outbound Communication
  enable_nat_gateway = true                     # This is correct
  single_nat_gateway = true                     # This is correct

  # VPC DNS Parameters
  enable_dns_hostnames = true                   # This is correct
  enable_dns_support   = true                   # This is correct

  # Subnet Tags
  public_subnet_tags = {
    Type = "public-subnets"
  }

  private_subnet_tags = {
    Type = "private-subnets"
  }

  database_subnet_tags = {
    Type = "database-subnets"
  }

  # Tags for VPC and Resources
  tags = {
    Owner       = "Mukesh"
    Environment = "dev"
  }

  vpc_tags = {
    Name = "vpc-dev"
  }
}
