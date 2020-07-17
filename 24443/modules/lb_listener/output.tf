
output "arn" {
  value       = aws_lb_listener.listener.*.arn
  description = "The id of the listener"
}

