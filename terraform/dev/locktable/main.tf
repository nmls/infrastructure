provider "aws" {
  profile = "dev"
  region = "eu-west-2"
}

module "dev-locktable" {
  source = "../../modules/locktable"
  env_full = "${var.env_full}"
  vendor = "${var.vendor}"
  project = "${var.project}"
}

