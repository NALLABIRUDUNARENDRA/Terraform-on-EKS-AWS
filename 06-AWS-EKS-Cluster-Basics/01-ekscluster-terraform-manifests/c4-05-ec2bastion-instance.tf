# AWS EC2 INSTANCE TERRAFORM MODULE
# BASTION HOST -EC2 INSTANCE THAT WILL BE CREATED IN VPC PUBLIC SUBNET
module "ec2_public" {
  source = "terraform-aws-modules/ec2-instance/aws"
  version = "5.2.1"

  name = "${local.name}-BastionHost"

  ami                     =  data.aws_ami.ubuntu.id
  instance_type           = var.instance_type
  key_name                = var.instance_keypair
 #    monitoring              = "true"
  vpc_security_group_ids  = [module.public_bastion_host.security_group_id]
  subnet_id = module.vpc.public_subnets[0]

  tags = local.common_tags
}