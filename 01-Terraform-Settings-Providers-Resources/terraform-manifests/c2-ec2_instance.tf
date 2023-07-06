resource "aws_instance" "myec2" {
  ami = "ami-053b0d53c279acc90"  #ubuntu:22.04 LTS
  instance_type = "t2.nano"
  user_data = file("${path.module}/app1-install.sh")
  tags = {
    "Name" = "EC2 Demo"
  }
}