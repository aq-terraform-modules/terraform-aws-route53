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

data "cloudflare_zone" "main_domain" {
  name = var.main_domain
}

resource "random_integer" "random" {
  min = 1
  max = 99999999
}

resource "aws_route53_zone" "aws_subdomain" {
  name = "${var.sub_domain}-${random_integer.random.result}.${var.main_domain}"
}

resource "cloudflare_record" "aws_subdomain_dns" {
  count      = length(aws_route53_zone.aws_subdomain.name_servers)
  zone_id    = data.cloudflare_zone.main_domain.id
  name       = var.sub_domain
  value      = aws_route53_zone.aws_subdomain.name_servers[count.index]
  type       = "NS"
  depends_on = [aws_route53_zone.aws_subdomain]
}
