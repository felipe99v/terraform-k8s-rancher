resource "aws_vpc" "vpc_main" {
  instance_tenancy     = "default"
  enable_dns_hostnames = "true"
  cidr_block           = var.CIDR_VPC

  tags = {
    Name = var.Name_VPC
  }
}

resource "aws_subnet" "public_app_subnets" {
  count             = length(var.public_subnet_cidrs)
  vpc_id            = aws_vpc.vpc_main.id
  cidr_block        = element(var.public_subnet_cidrs, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "${var.Name_Public_Subnet}-${count.index + 1}"
  }
}

resource "aws_subnet" "private_app_subnets" {
  count             = length(var.private_subnet_cidrs)
  vpc_id            = aws_vpc.vpc_main.id
  cidr_block        = element(var.private_subnet_cidrs, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "${var.Name_private_app_Subnet}-${count.index + 1}"
  }
}


resource "aws_subnet" "private_BD_subnets" {
  count             = length(var.private_subnet_DB_cidrs)
  vpc_id            = aws_vpc.vpc_main.id
  cidr_block        = element(var.private_subnet_DB_cidrs, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "Private DB Subnet ${count.index + 1}"
    Name = "${var.Name_private_db_Subnet}-${count.index + 1}"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc_main.id

  tags = {
    Name = var.Name_IG
  }
}

resource "aws_eip" "ip" {
  count  = var.Create_Nat_Gateway ? 1 : 0
  domain = "vpc"
}


resource "aws_nat_gateway" "Nat_Gateway" {
  count         = var.Create_Nat_Gateway ? 1 : 0
  allocation_id = aws_eip.ip[count.index].id
  subnet_id     = aws_subnet.public_app_subnets[0].id

  tags = {
    Name = var.Name_Nat
  }
}


resource "aws_route_table" "public_app_rt" {
  vpc_id = aws_vpc.vpc_main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = var.Name_public_RT
  }
}

resource "aws_route_table" "private_app_rt" {
  vpc_id = aws_vpc.vpc_main.id

  tags = {
    Name = var.Name_private_RT
  }
}

resource "aws_route_table" "private_DB_rt" {
  vpc_id = aws_vpc.vpc_main.id

  tags = {
    Name = var.Name_private_BD_RT
  }
}

resource "aws_route_table_association" "public_subnet_asso" {
  count          = length(var.public_subnet_cidrs)
  subnet_id      = element(aws_subnet.public_app_subnets[*].id, count.index)
  route_table_id = aws_route_table.public_app_rt.id
}

resource "aws_route_table_association" "private_subnet_asso" {
  count          = length(var.private_subnet_cidrs)
  subnet_id      = element(aws_subnet.private_app_subnets[*].id, count.index)
  route_table_id = aws_route_table.private_app_rt.id
}

resource "aws_route_table_association" "private_BD_subnet_asso" {
  count          = length(var.private_subnet_DB_cidrs)
  subnet_id      = element(aws_subnet.private_BD_subnets[*].id, count.index)
  route_table_id = aws_route_table.private_DB_rt.id
}

/*resource "aws_route" "Nat_Gateway_Route_DB" {
  route_table_id         = aws_route_table.private_DB_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.Nat_Gateway.id
}*/

resource "aws_route" "Nat_Gateway_Route_APP" {
  count                  = var.Create_Nat_Gateway ? 1 : 0
  route_table_id         = aws_route_table.private_app_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.Nat_Gateway[count.index].id
}