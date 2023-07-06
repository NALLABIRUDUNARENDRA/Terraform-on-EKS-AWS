output "for_output_list" {
  value = ["aws_instance.myec2: instance.public_dns"]
}

output "for_output_map" {
  value = "{aws_instance.myec2: instance.id => instance.public_dns}"
}

# output - for loop with map Advaced
output "for_output_map2" {
  value = "{for c, instance in aws_instance.myec2: c => instance.public_dns }"
}

# OutPut Legacy Splat Operator (Legacy) - Returns the List
output "legacy_splat_instance_publicdns" {
  value = "{aws_instance.myec2.*.public_dns}"
}


# OutPut latest Generalized Splat Operator (Legacy) - Returns the List
output "latest_splat_instance_publicdns" {
  value = "{aws_instance.myec2[*].public_dns}"
}
