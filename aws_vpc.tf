# Terraform provider aws
provider "aws" {
  region = "us-east-1"
}

# Create a VPC
resource "aws_vpc" "vpc_network" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "terraform-vpc"
  }
}

# Create a subnet within the VPC
resource "aws_subnet" "subnet" {
  vpc_id            = aws_vpc.vpc_network.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "us-east-1c"
  tags = {
    Name = "terraform-subnet"
  }
}

# Create an internet gateway
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc_network.id
  tags = {
    Name = "terraform-igw"
  }
}
