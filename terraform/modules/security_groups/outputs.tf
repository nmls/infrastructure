output "bastion_sg" {
  value = "${aws_security_group.bastion.id}"
}
output "build_sg" {
  value = "${aws_security_group.build.id}"
}
