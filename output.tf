output "name_servers" {
  description = "Output the route53 zone nameservers for troubleshooting"
  value = aws_route53_zone.aws_subdomain.name_servers
}