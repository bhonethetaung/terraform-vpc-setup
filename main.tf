# Create a VPC
resource "aws_vpc" "testing-mb" {
  cidr_block = "10.0.0.0/16" #adjust with your requirement

  tags = {
    Name = "testing-mb-vpc" #adjust with your requirement
  }
}

resource "aws_vpc_ipv4_cidr_block_association" "secondry-cidr" {
  vpc_id = aws_vpc.testing-mb.id
  cidr_block = "172.15.0.0/16" #adjust with your requirement
}

resource "aws_subnet" "public_sub" {
  vpc_id            = aws_vpc.testing-mb.id
  count = length(var.public-sub)
  cidr_block        = element(var.public-sub, count.index)
  availability_zone = "us-east-1a" #adjust with your requirement

  tags = {
    Name = "Public Subnet ${count.index + 1}"
  }
}

resource "aws_subnet" "private_sub" {
  vpc_id = aws_vpc.testing-mb.id
  count = length(var.private-sub)
  cidr_block = element(var.private-sub, count.index)
  availability_zone = "us-east-1b" #adjust with your requirement

  tags = {
    Name = "Private Subnet ${count.index + 1}"
  }
}

resource "aws_internet_gateway" "mb-igw" {
    vpc_id = aws_vpc.testing-mb.id
    
    tags = {
        Name = "mb-igw" 
    }
  
}

resource "aws_route_table" "internet-rtb" {
  vpc_id = aws_vpc.testing-mb.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.mb-igw.id
  }

    tags = {
      Name = "Private Route Table"
    }
}

resource "aws_route_table_association" "public-rtb" {
  count = length(var.public-sub)
  subnet_id = element(aws_subnet.public_sub.*.id, count.index)
  route_table_id = aws_route_table.internet-rtb.id
}