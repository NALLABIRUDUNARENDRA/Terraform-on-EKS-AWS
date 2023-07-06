resource "aws_instance" "myec2" {
  ami = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name = var.key_name
  user_data = file("${path.module}/app1-install.sh")
  vpc_security_group_ids = ["${aws_security_group.vpc_ssh.id}","${aws_security_group.vpc_web.id}"]
  tags = {
    "Name" = "EC2 Demo-1"
  }
}