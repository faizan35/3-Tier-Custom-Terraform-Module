resource "aws_vpc" "hulk-vpc" {
  cidr_block       = var.cidr_vpc
  instance_tenancy = "default"

  tags = {
    Name = "hulk-VPC"
  }
}

resource "aws_subnet" "public-hulk-subnet" {
  vpc_id     = aws_vpc.hulk-vpc.id
  cidr_block = var.public_cidr_vpc

  map_public_ip_on_launch = true

  availability_zone = data.aws_availability_zones.available.names

  tags = {
    Name = "Hulk-Pub-Subnet"
  }
}

resource "aws_subnet" "private-hulk-subnet" {
  vpc_id     = aws_vpc.hulk-vpc.id
  cidr_block = var.private_cidr_vpc

  availability_zone = data.aws_availability_zones.available.names

  tags = {
    Name = "Hulk-Pri-Subnet"
  }
}


resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.hulk-vpc.id

  tags = {
    Name = "hullk-IGW"
  }
}


# Route table for Public

resource "aws_route_table" "pub-rt" {
  vpc_id = aws_vpc.hulk-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Public RT"
  }
}

resource "aws_route_table_association" "rta" {
  subnet_id      = aws_subnet.public-hulk-subnet.id
  route_table_id = aws_route_table.pub-rt.id
}



# Route table for Private

resource "aws_route_table" "pri-rt" {
  vpc_id = aws_vpc.hulk-vpc.id

  tags = {
    Name = "Public RT"
  }
}

resource "aws_route_table_association" "rta" {
  subnet_id      = aws_subnet.private-hulk-subnet.id
  route_table_id = aws_route_table.pub-rt.id
}