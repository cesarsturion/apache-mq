data "aws_vpc" "vpc" {
  tags = {
    Name = "alelo-dextra-backup-vpc"
  }
}

data "aws_subnet_ids" "private" {
  vpc_id = data.aws_vpc.vpc.id

  tags = {
    Name = "alelo-dextra-backup-private-subnet"
  }
}

data "aws_subnet_ids" "public" {
  vpc_id = data.aws_vpc.vpc.id

  tags = {
    Name = "alelo-dextra-backup-public-subnet"
  }
}

data "aws_route_tables" "rts" {
  vpc_id = data.aws_vpc.vpc.id

  tags = {
    Name = "alelo-dextra-backup-route-table-private"
  }
}

data "aws_security_group" "selected" {
  tags = {
    Name = "alelo-dextra-backup-private-sec-group"
  }
}
