resource "aws_vpc" "kubernetes-cluster" {
  cidr_block           = "${var.vpc_cidr_block}"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags                 = {
    Name               = "kubernetes-cluster"
  }
}

resource "aws_subnet" "subnet-a" {
  vpc_id            = "${aws_vpc.kubernetes-cluster.id}"
  cidr_block        = "${var.subnet-a_cidr_block}"
  availability_zone = "${var.subnet-a_availability_zone}"
  tags              = {
    Name            = "subnet-a"
  }
}

resource "aws_subnet" "subnet-b" {
  vpc_id            = "${aws_vpc.kubernetes-cluster.id}"
  cidr_block        = "${var.subnet-b_cidr_block}"
  availability_zone = "${var.subnet-b_availability_zone}"
  tags              = {
    Name            = "subnet-b"
  }
}

resource "aws_subnet" "subnet-c" {
  vpc_id            = "${aws_vpc.kubernetes-cluster.id}"
  cidr_block        = "${var.subnet-c_cidr_block}"
  availability_zone = "${var.subnet-c_availability_zone}"
  tags              = {
    Name            = "subnet-c"
  }
}
