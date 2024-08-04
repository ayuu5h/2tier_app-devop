output "frontend_ip" {
  value = aws_instance.frontend.public_ip
}

output "backend_private_ip" {
  value = aws_instance.backend.private_ip
}

output "frontend_dns" {
  value = aws_instance.frontend.public_dns
} 
