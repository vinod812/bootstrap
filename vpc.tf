# Internet VPC
resource "aws_vpc" "vvvpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = "vvvpc"
  }
}

# Subnets
resource "aws_subnet" "vv-public-1" {
  vpc_id                  = aws_vpc.vvvpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.availability_zone
  tags = {
    Name = "vv-public-1"
  }
}
resource "aws_subnet" "vv-private-1" {
  vpc_id                  = aws_vpc.vvvpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = var.availability_zone

  tags = {
    Name = "vv-private-1"
  }
}

# Internet GW
resource "aws_internet_gateway" "vv-igw" {
  vpc_id = aws_vpc.vvvpc.id
  tags = {
    Name = "vv-igw"
  }
}

# route tables
resource "aws_route_table" "vv-roundtable" {
  vpc_id = aws_vpc.vvvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vv-igw.id
  }

  tags = {
    Name = "vv-roundtable"
  }
}

# route associations public
resource "aws_route_table_association" "vv-public-1-a" {
  subnet_id      = aws_subnet.vv-public-1.id
  route_table_id = aws_route_table.vv-roundtable.id
}

resource "aws_route_table_association" "vv-private-1-a" {
  subnet_id      = aws_subnet.vv-private-1.id
  route_table_id = aws_route_table.vv-roundtable.id
}


