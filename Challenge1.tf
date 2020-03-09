# Specify the provider and access details
provider "aws" {
  region = var.aws_region
}

# Create a VPC to launch our instances into
resource "aws_vpc" "default" {
  cidr_block = var.aws_vpc_cidr
  tags = {
    Name = "Challenge_1_VPC"
  }
}

# Create an internet gateway to give our subnet access to the outside world
resource "aws_internet_gateway" "default" {
  vpc_id = aws_vpc.default.id
}

# Grant the VPC internet access on its main route table
resource "aws_route" "internet_access" {
  route_table_id         = aws_vpc.default.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.default.id
}

# Define a webserver subnet primary availability zone
resource "aws_subnet" "webserverssubnet" {
  vpc_id                  = aws_vpc.default.id
  cidr_block              = var.aws_webserver_subnet_cidr
  map_public_ip_on_launch = false
  availability_zone       = var.primary_az
  tags = {
    Name = "Webservers"
  }
}

resource "aws_subnet" "natgatewaysubnet" {
  vpc_id                  = aws_vpc.default.id
  cidr_block              = var.aws_natgateway_subnet_cidr
  map_public_ip_on_launch = false
  availability_zone       = var.primary_az
  tags = {
    Name = "NatGateway"
  }
}

resource "aws_subnet" "jumpboxsubnet" {
  vpc_id                  = aws_vpc.default.id
  cidr_block              = var.aws_jumpbox_subnet_cidr
  map_public_ip_on_launch = false
  availability_zone       = var.primary_az
  tags = {
    Name = "JumpBox"
  }
}
resource "aws_subnet" "businesslogicsubnet" {
  vpc_id                  = aws_vpc.default.id
  cidr_block              = var.aws_businesslogic_subnet_cidr
  map_public_ip_on_launch = false
  availability_zone       = var.primary_az
  tags = {
    Name = "BusinessLogic"
  }
}
resource "aws_subnet" "databasesubnet" {
  vpc_id                  = aws_vpc.default.id
  cidr_block              = var.aws_database_subnet_cidr
  map_public_ip_on_launch = false
  availability_zone       = var.primary_az
  tags = {
    Name = "Databases"
  }
}