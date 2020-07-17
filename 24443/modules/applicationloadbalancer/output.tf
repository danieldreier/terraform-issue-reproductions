output "alb_dns_name" {
  value       = aws_alb.alb.dns_name
  description = "The dns name of the loadbalancer"
}

output "alb_arn" {
  value       = aws_alb.alb.arn
  description = "The arn name of the loadbalancer"
}
