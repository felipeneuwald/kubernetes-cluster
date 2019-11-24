resource "aws_vpc" "kubernetes-cluster" {
  cidr_block           = "${var.vpc_cidr_block}"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags                 = {
    Name               = "kubernetes-cluster"
    Project            = "kubernetes-cluster"
  }
}

resource "aws_internet_gateway" "kubernetes-cluster" {
  vpc_id    = "${aws_vpc.kubernetes-cluster.id}"
  tags      = {
    Name    = "kubernetes-cluster"
    Project = "kubernetes-cluster"
  }
}

resource "aws_route" "kubernetes-cluster" {
  route_table_id         = "${aws_vpc.kubernetes-cluster.default_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.kubernetes-cluster.id}"
}

resource "aws_subnet" "subnet-a" {
  vpc_id                  = "${aws_vpc.kubernetes-cluster.id}"
  cidr_block              = "${var.subnet-a_cidr_block}"
  availability_zone       = "${var.subnet-a_availability_zone}"
  map_public_ip_on_launch = true
  tags                    = {
    Name                  = "subnet-a"
    Project               = "kubernetes-cluster"
  }
}

resource "aws_subnet" "subnet-b" {
  vpc_id                  = "${aws_vpc.kubernetes-cluster.id}"
  cidr_block              = "${var.subnet-b_cidr_block}"
  availability_zone       = "${var.subnet-b_availability_zone}"
  map_public_ip_on_launch = true
  tags                    = {
    Name                  = "subnet-b"
    Project               = "kubernetes-cluster"
  }
}

resource "aws_subnet" "subnet-c" {
  vpc_id                  = "${aws_vpc.kubernetes-cluster.id}"
  cidr_block              = "${var.subnet-c_cidr_block}"
  availability_zone       = "${var.subnet-c_availability_zone}"
  map_public_ip_on_launch = true
  tags                    = {
    Name                  = "subnet-c"
    Project               = "kubernetes-cluster"
  }
}
