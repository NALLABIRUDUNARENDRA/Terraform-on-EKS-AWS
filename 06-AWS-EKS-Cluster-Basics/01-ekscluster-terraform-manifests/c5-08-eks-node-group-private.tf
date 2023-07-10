# Create AWS EKS NODE GROUP - PRIVATE
resource "aws_eks_node_group" "eks_nodegroup_private" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "${local.name}-eks-nodegroup-private"
  node_role_arn   = aws_iam_role.eks_nodegroup_role.arn
  subnet_ids      = module.vpc.private_subnets
   #version = var.cluster_version #(OPTIONAL: DEFAULT TO EKS CLUSTER KUBERNETES VERSION)
  ami_type = "AL2_x86_64"
  capacity_type = "ON_DEMAND"
  disk_size = 20
  instance_types = [ "t3.medium" ]

  remote_access {
    ec2_ssh_key = "Terraform-on-EKS-AWS"
  }

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
    #max_unavailable_percentage = 50 # ANY ONE TO USE
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.EKS-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.EKS-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.EKS-AmazonEC2ContainerRegistryReadOnly,
  ]

  tags = {
    name = "Private-Node-Group"
  }
}