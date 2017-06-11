output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}
output "subnet_a" {
  value = "${aws_subnet.subnet_a.id}"
}
