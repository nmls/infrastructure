variable "vendor" {
  default = "laatu"
}
variable "project" {
  default = "jordgubbe"
}
variable "aws_region" {
  default = "eu-west-2"
}
variable "env" {
  default = "dev"
}
variable "env_full" {
  default = "eu-west-2-dev"
}
variable "public_domain" {
  default = "eu-west-2.aws.laatu.io"
}
variable "internal_domain" {
  default = "eu-west-2.aws.laatu.internal"
}
variable "vpc_cidr" {
  default = "172.31.0.0/16"
}
variable "subnet_a_cidr" {
  default = "172.31.0.0/20"
}
variable "subnet_b_cidr" {
  default = "172.31.16.0/20"
}
