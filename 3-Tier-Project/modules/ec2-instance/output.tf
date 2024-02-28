output "instance-ID" {
  value = aws_instance.web.*.id
}