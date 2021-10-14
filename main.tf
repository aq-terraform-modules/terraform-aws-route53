terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
  }
}

resource "aws_route53_zone" "aws_subdomain" {
  name = var.domain_name
}

resource "cloudflare_record" "aws_subdomain_dns" {
  count   = length(aws_route53_zone.aws_subdomain.name_servers)
  zone_id = var.cloudflare_zone_id
  name    = var.domain_name
  value   = aws_route53_zone.aws_subdomain.name_servers[count.index]
  type    = "NS"
}
