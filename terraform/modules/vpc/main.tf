resource "aws_vpc" "vpc" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_hostnames = "true"
  tags {
    Name = "${var.env}"
  }
}

resource "aws_subnet" "subnet_a" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "${var.subnet_a_cidr}"
  map_public_ip_on_launch = true
  availability_zone = "${var.aws_region}a"
  tags {
    Name = "${var.env}_a"
  }
}

resource "aws_subnet" "subnet_b" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "${var.subnet_b_cidr}"
  map_public_ip_on_launch = true
  availability_zone = "${var.aws_region}b"
  tags {
    Name = "${var.env}_b"
  }
}

resource "aws_internet_gateway" "gateway" {
  vpc_id = "${aws_vpc.vpc.id}"
}

resource "aws_route" "internet" {
  route_table_id = "${aws_vpc.vpc.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = "${aws_internet_gateway.gateway.id}"
}
