# Create A NULL RESOURCE AND PROVISIONERS
resource "null_resource" "copy_ec2_keys" {
  depends_on = [module.ec2_public]
# CONNECTION BLOCK FOR PROVISIONERS TO CONNECT TO EC2 INSTANCE
 connection {
   type = "ssh"
   host = aws_eip.bastion_eip.public_ip
   user = "ubuntu"
   password = ""
   private_key = file("private_key/Terraform-on-EKS-AWS.pem")
 }
## FILE PROVISIONER: COPIES THE Terraform-on-EKS-AWS.Pem FILE TO /tmp/Terraform-on-EKS-AWS.pem
provisioner "file" {
 source = "private_key/Terraform-on-EKS-AWS.pem"
 destination =  "/tmp/Terraform-on-EKS-AWS.pem"
 }
## REMOTE EXEC PROVISIONER: USING REMOTE-EXEC PROVISIONER FIX THE PRIVATE KEY
provisioner "remote-exec" {
 inline = [
     "sudo chmod 400 /tmp/Terraform-on-EKS-AWS.pem"
 ]
 }
## LOCAL EXEC PROVISIONER: LOCAL-EXEC PROVISIONER (Creation-Time provisioner)
provisioner "local-exec" {
 command = "echo VPC created on 'date' and VPC ID: ${module.vpc.vpc_id} >> creation-time-vpc-id.txt"
 working_dir = "local-exec-output-files"
 }
}