output "name_servers" {
  description = "Output the route53 zone nameservers for troubleshooting"
  value = aws_route53_zone.aws_subdomain.name_servers
}

output "zone_id" {
  description = "Zone ID of the Route53 Zone"
  value = aws_route53_zone.aws_subdomain.zone_id
}

output "name" {
  description = "Zone Name of the Route53 Zone"
  value = aws_route53_zone.aws_subdomain.name
}
