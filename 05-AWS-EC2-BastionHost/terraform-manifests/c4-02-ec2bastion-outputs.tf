# AWS EC2 INSTANCE TERRAFORM OUTPUTS
# PUBLIC EC2 INSTANCE - BASTION HOST

## ec2_bastion_public_instance_ids
output "ec2_bastion_public_instance_ids" {
  value = module.ec2_public.id
}

## ec2_bastion_public_ip
output "ec2_bastion_eip" {
  value = aws_eip.bastion_eip.public_ip
}