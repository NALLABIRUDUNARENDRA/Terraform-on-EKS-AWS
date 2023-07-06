# EC2 Instance Public IP with Toset
output "instance_publicip" {
#   value = "{aws_instance.myec2[*].public_ip}"
#   value = "{aws_instance.myec2.*.public_ip}"
value = [for instance in aws_instance.myec2: instance.public_ip]
}


# EC2 Instance Public IP with Toset
output "instance_publicdns" {
#   value = "{aws_instance.myec2[*].public_dns}"
#   value = "{aws_instance.myec2.*.public_dns}"
value = [for instance in aws_instance.myec2: instance.public_dns]
}

#EC2 Instance Public DNS with TOMAP
output "instance_publicdns2" {
  value = [for instance in aws_instance.myec2: instance.public_dns]
}

