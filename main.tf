resource "aws_route53_zone" "aws_subdomain" {
  name = "${var.sub_domain}.${var.main_domain}"
}