resource "aws_eks_node_group" "pathnex-NG" {
  cluster_name    = aws_eks_cluster.pathnex.name
  node_group_name = "pathnex-nov-ng"

  node_role_arn = aws_iam_role.eks_node_role.arn

  subnet_ids = [
    "subnet-0c8e402019bf39260",
    "subnet-036e80f1443e50c12",
    "subnet-06fe4b0251c95b8a1"
  ]

  version        = "1.36"
  ami_type       = "AL2023_x86_64_STANDARD"
  capacity_type  = "SPOT"
  instance_types = ["t3.small"]
  disk_size      = 20

  scaling_config {
    desired_size = 1
    min_size     = 1
    max_size     = 2
  }

  tags = {
    "k8s.io/cluster-autoscaler/enabled"          = "true"
    "k8s.io/cluster-autoscaler/Pathnex-nov-2026" = "owned"
  }

  lifecycle {
    ignore_changes = [
      scaling_config[0].desired_size
    ]
  }



  update_config {
    max_unavailable = 1
    update_strategy = "DEFAULT"
  }

  remote_access {
    ec2_ssh_key = "Pathnex.pem"

    source_security_group_ids = [
      "sg-0d257e9dec69dbffd"
    ]
  }

  depends_on = [
  aws_iam_role_policy_attachment.eks_worker_node,
  aws_iam_role_policy_attachment.eks_cni,
  aws_iam_role_policy_attachment.eks_ecr
]
}
