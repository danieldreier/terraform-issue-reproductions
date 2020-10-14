

output "tg_ids" {
  value       = aws_lb_target_group.tg.*.arn
  description = "The id of the targetgroup"
}

