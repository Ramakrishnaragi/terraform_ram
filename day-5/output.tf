output "instance_public_ip" {
    value = aws_instance.demo.public_ip
    sensitive = true
}

output "instance_id"{
    value = aws_instance.demo.id
}
output "instance_public_dns" {
    value = aws_instance.demo.public_dns
  
}
output "instance_arn" {
    value = aws_instance.demo.arn
  
}