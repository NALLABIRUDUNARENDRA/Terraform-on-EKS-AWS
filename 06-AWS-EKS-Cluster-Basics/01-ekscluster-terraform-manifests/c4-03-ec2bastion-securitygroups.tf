# AWS EC2 SECURITY GROUP TERRAFORM MODULE
# SECURITY GROUP FOR PUBLIC BASTION HOST
module "public_bastion_host" {
   source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"

  name        = "${local.name}-public_bastion_host_sg"
  description = "Security group for with SSH Port open for everybody (IP4 CIDR), egress ports are all world open"
  vpc_id      = module.vpc.vpc_id

 # INGRESS RULES & CIDR BLOCKS
  ingress_rules = ["ssh-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]

  # EGRESS RULES - all-all open
 egress_rules = ["all-all"]
  tags = local.common_tags
}