provider "aws" {
  profile = "${var.env}"
  region = "${var.aws_region}"
}

terraform {
  backend "s3" {
    bucket = "laatu-jordgubbe-terraform-eu-west-2-dev"
    key = "bastion/terraform.tfstate"
    region = "eu-west-2"
    dynamodb_table = "jordgubbe-terraform-statelock-eu-west-2-dev"
  }
}

module "vpc" {
  source = "../../modules/vpc"
  aws_region = "${var.aws_region}"
  name = "dev"
  vpc_cidr = "${var.vpc_cidr}"
  subnet_a_cidr = "${var.subnet_a_cidr}"
  subnet_b_cidr = "${var.subnet_b_cidr}"
}

module "security_groups" {
  source = "../../modules/security_groups"
  access_ip_ranges = "${var.access_ip_ranges}"
  vpc_id = "${module.vpc.vpc_id}"
}

