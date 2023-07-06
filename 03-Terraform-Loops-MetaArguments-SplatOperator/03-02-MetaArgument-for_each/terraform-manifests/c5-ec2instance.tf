# Availability_zones DataSource
data "aws_availability_zones" "my_azs" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}


# EC2 instance

resource "aws_instance" "myec2" {
  ami = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
#   instance_type = var.instance_type_list[1] # For list
#  instance_type = var.instance_type_map["prod"] # For Map
  key_name = var.key_name
  user_data = file("${path.module}/app1-install.sh")
  vpc_security_group_ids = ["${aws_security_group.vpc_ssh.id}","${aws_security_group.vpc_web.id}"]
  # Create EC2 instance in all Availability Zones of a VPC
  for_each = toset(data.aws_availability_zones.my_azs.names)
  availability_zone = each.key # you can also use each.value because for list items each.key
  
  tags = {
    "Name" = "EC2 Demo-${each.key}"
  }
}
