#Cluster resources
resource "aws_eks_cluster" "eks_cluster" {
  name     = var.Name_EKS
  role_arn = aws_iam_role.eks_role.arn
  version  = var.Version_EKS

  access_config {
    authentication_mode = var.Authentication_Mode_EKS
  }


  vpc_config {
    subnet_ids = var.subnet_id
  }

  depends_on = [
    aws_iam_role_policy_attachment.cluster_AmazonEKSClusterPolicy,
  ]
}

resource "aws_iam_role" "eks_role" {
  name = var.Name_EKS_Role
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "sts:AssumeRole",
          "sts:TagSession"
        ]
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "cluster_AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks_role.name
}


#Node group resources
resource "aws_eks_node_group" "eks_node_group" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = var.Name_Node_Group_EKS
  node_role_arn   = aws_iam_role.eks_node_role.arn

  subnet_ids = var.subnet_id

  capacity_type  = var.Capacity_Node_Group_EKS
  instance_types = [var.Instance_Type_Node_Group_EKS]

  scaling_config {
    desired_size = var.Desired_Size_Node_Group_EKS
    max_size     = var.Max_Size_Node_Group_EKS
    min_size     = var.Min_Size_Node_Group_EKS
  }

  update_config {
    max_unavailable = 1
  }

  labels = {
    node = var.label_Node_Group_EKS
  }

  depends_on = [
    aws_iam_role_policy_attachment.nodes-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.nodes-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.nodes-AmazonEC2ContainerRegistryReadOnly,
  ]
}

resource "aws_iam_role" "eks_node_role" {
  name = var.Name_EKS_Node_Role

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "nodes-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.eks_node_role.name
}

resource "aws_iam_role_policy_attachment" "nodes-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.eks_node_role.name
}

resource "aws_iam_role_policy_attachment" "nodes-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.eks_node_role.name
}