
#VPC
resource "aws_vpc" "myvpc" {
  cidr_block       = var.cidr_vpc #65536 host IP (FIP -> 10.0.0.0    -----  LIP 10.0.255.255)
  instance_tenancy = "default"

  tags = {
    Name = "Project-VPC"
  }
}
#IGW
resource "aws_internet_gateway" "tigw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "T-IGW"
  }
}
#subnet
#PUb subnet 1
resource "aws_subnet" "pubsub1" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = var.subpub1
  availability_zone = var.az_sub_pub1

  tags = {
    Name = "PUB-SUB-1"
  }
}
#PUb subnet 2
resource "aws_subnet" "pubsub2" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = var.subpub2
  availability_zone = var.az_sub_pub2

  tags = {
    Name = "PUB-SUB-2"
  }
}

# PUB-RT-1
resource "aws_route_table" "pubrt1" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tigw.id
  }

  tags = {
    Name = "RT-PUBRT-1"
  }
}

#PUB-RT-2
resource "aws_route_table" "pubrt2" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tigw.id
  }

  tags = {
    Name = "RT-PUBRT-2"
  }
}

#PVT-RT-1

#Route table Asc
#ASCPUB SUB 1
resource "aws_route_table_association" "pubasc1" {
  subnet_id      = aws_subnet.pubsub1.id
  route_table_id = aws_route_table.pubrt1.id
}
#ASCPUB SUB 1
resource "aws_route_table_association" "pubasc2" {
  subnet_id      = aws_subnet.pubsub2.id
  route_table_id = aws_route_table.pubrt2.id
}

