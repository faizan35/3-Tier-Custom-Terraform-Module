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

  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "Hulk-Pub-Subnet"
  }
}

resource "aws_subnet" "private-hulk-subnet" {
  vpc_id     = aws_vpc.hulk-vpc.id
  cidr_block = var.private_cidr_vpc

  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    Name = "Hulk-Pri-Subnet"
  }
}

###################################
resource "aws_subnet" "private-hulk-subnet-2" {
  vpc_id     = aws_vpc.hulk-vpc.id
  cidr_block = var.private_cidr_vpc-2

  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    Name = "Hulk-Pri-Subnet"
  }
}


#################################


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

resource "aws_route_table_association" "pub-rta" {
  subnet_id      = aws_subnet.public-hulk-subnet.id
  route_table_id = aws_route_table.pub-rt.id
}

######################################

resource "aws_eip" "lb" {
  domain   = "vpc"
}

resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.lb.id
  subnet_id     = aws_subnet.private-hulk-subnet.id

  tags = {
    Name = "gw NAT"
  }

  depends_on = [aws_internet_gateway.igw]
}


##########################################




# Route table for Private

resource "aws_route_table" "pri-rt" {
  vpc_id = aws_vpc.hulk-vpc.id

  tags = {
    Name = "Private RT"
  }
}

resource "aws_route_table_association" "pri-rta" {
  subnet_id      = aws_subnet.private-hulk-subnet.id
  route_table_id = aws_route_table.pri-rt.id   ##  one change
}

##############################################
resource "aws_route" "private-route" {
  route_table_id         = aws_route_table.pri-rt.id
  destination_cidr_block = "0.0.0.0/0"  # Destination CIDR block for internet-bound traffic
  nat_gateway_id         = aws_nat_gateway.nat-gw.id  # ID of your NAT Gateway
}

#################################################