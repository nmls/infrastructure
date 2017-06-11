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
  env = "${var.env}"
  vpc_cidr = "${var.vpc_cidr}"
  subnet_a_cidr = "${var.subnet_a_cidr}"
  subnet_b_cidr = "${var.subnet_b_cidr}"
}

module "security_groups" {
  source = "../../modules/security_groups"
  access_ip_ranges = "${var.access_ip_ranges}"
  vpc_id = "${module.vpc.vpc_id}"
}

module "key_pair" {
  source = "../../modules/key_pair"
  env = "${var.env}"
  public_key = "../../../shared/key-pairs/ssh.pub"
}

module "bastion" {
  source = "../../modules/bastion"
  env = "${var.env}"
  vpc_id = "${module.vpc.vpc_id}"
  subnet = "${module.vpc.subnet_a}"
  bastion_sg = "${module.security_groups.bastion_sg}"
  public_domain = "${var.public_domain}"
  public_domain_zone = "${var.public_domain_zone}"
  private_domain = "${var.private_domain}"
  private_domain_zone = "${var.private_domain_zone}"
}

