resource "aws_instance" "bastion" {
  connection {
    user = "centos"
  }
  instance_type = "t2.micro"
  ami = "ami-e05a4d84"
  vpc_security_group_ids = ["${var.bastion_sg}"]
  subnet_id = "${var.subnet}"
  tags {
    Name = "${var.env}-bastion"
  }
  root_block_device {
    volume_type = "gp2"
    volume_size = "32"
  }
  key_name = "${var.env}"
}

resource "aws_route53_record" "bastion_dns_public" {
  zone_id = "${var.public_domain_zone}"
  name = "bastion.${var.env}.${var.public_domain}"
  type = "A"
  ttl = "1"
  records = ["${aws_instance.bastion.public_ip}"]
}

resource "aws_route53_record" "bastion_dns_private" {
  zone_id = "${var.private_domain_zone}"
  name = "bastion.${var.env}.${var.private_domain}"
  type = "A"
  ttl = "1"
  records = ["${aws_instance.bastion.private_ip}"]
}

