output "instance_public" {
    value = "aws_instance.myec2.public_ip"
}

output "instance_publicdns" {
    value = "aws_instance.myec2.public_dns"
}