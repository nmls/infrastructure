resource "aws_key_pair" "key_pair" {
  key_name = "${var.env}"
  public_key = "${file(var.public_key)}"
}
