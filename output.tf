output "public-ip-address" {
  value = aws_instance.webapp.public_ip
}