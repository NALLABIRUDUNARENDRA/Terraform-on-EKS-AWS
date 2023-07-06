resource "aws_instance" "myec2" {
  ami = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
#   instance_type = var.instance_type_list[1] # For list
#  instance_type = var.instance_type_map["prod"] # For Map
  key_name = var.key_name
  user_data = file("${path.module}/app1-install.sh")
  vpc_security_group_ids = ["${aws_security_group.vpc_ssh.id}","${aws_security_group.vpc_web.id}"]
  count = 2
  tags = {
    "Name" = "EC2 Demo-${count.index}"
  }
}
