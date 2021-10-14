resource "aws_route53_zone" "aws_subdomain" {
  name = var.domain_name
}
