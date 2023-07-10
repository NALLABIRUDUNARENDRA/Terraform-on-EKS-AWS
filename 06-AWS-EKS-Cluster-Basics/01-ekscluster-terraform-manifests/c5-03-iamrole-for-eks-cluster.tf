# create IAM Role
resource "aws_iam_role" "eks_master_role" {
  name = "${local.name}-eks-master-role"

  assume_role_policy = <<POLICY

  {
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
        
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

# ASSOCIATE IAM POLICY TO IAM ROLE
resource "aws_iam_role_policy_attachment" "EKS-AmazonEKSClusterPoilicy" {
  role       = aws_iam_role.eks_master_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

# ASSOCIATE IAM POLICY TO IAM ROLE
resource "aws_iam_role_policy_attachment" "EKS-AmazonEKSVPCResourceController" {
  role       = aws_iam_role.eks_master_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
}
