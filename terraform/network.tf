resource "aws_vpc" "kubernetes-cluster" {
  cidr_block           = "${var.vpc_cidr_block}"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name               = "kubernetes-cluster"
  }
}

###### VPC is running only with public subnets
###### TO-DO: VPC with public and private subnets

resource "aws_subnet" "subnet-1" {
  vpc_id            = "${aws_vpc.kubernetes-cluster.id}"
  cidr_block        = "${var.subnet-1_cidr_block}"
  availability_zone = "${var.subnet-1_availability_zone}"
  tags = {
    Name            = "subnet-1"
  }
}

resource "aws_subnet" "subnet-2" {
  vpc_id            = "${aws_vpc.kubernetes-cluster.id}"
  cidr_block        = "${var.subnet-2_cidr_block}"
  availability_zone = "${var.subnet-2_availability_zone}"
  tags = {
    Name            = "subnet-2"
  }
}

resource "aws_subnet" "subnet-3" {
  vpc_id            = "${aws_vpc.kubernetes-cluster.id}"
  cidr_block        = "${var.subnet-3_cidr_block}"
  availability_zone = "${var.subnet-3_availability_zone}"
  tags = {
    Name            = "subnet-3"
  }
}
