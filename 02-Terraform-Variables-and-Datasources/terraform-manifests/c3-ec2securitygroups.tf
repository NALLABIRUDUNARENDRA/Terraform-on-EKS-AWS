resource "aws_security_group" "vpc_ssh" {
  name        = "vpc_ssh"
  description = "DEV_vpc_ssh"
  ingress {
    description      = "allow port 22"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  tags = {
    Name = "VPC-SSH"
  }
}


# Create Security Group - Web Traffic

resource "aws_security_group" "vpc_web" {
  name        = "vpc_web"
  description = "DEV_vpc_web"

  ingress {
    description      = "allow port 80"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

 ingress {
    description      = "allow port 444"
    from_port        = 444
    to_port          = 444
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  tags = {
    Name = "VPC-WEB"
  }
}