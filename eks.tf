resource "aws_eks_cluster" "pathnex" {
  name     = "Pathnex-Nov-2026"
  role_arn = aws_iam_role.eks_cluster_role.arn
  version  = "1.36"

  upgrade_policy {
    support_type = "STANDARD"
  }

  vpc_config {
    subnet_ids = [
      "subnet-0c8e402019bf39260",
      "subnet-036e80f1443e50c12",
      "subnet-06fe4b0251c95b8a1"
  ]
  
    security_group_ids = [
      "sg-0d257e9dec69dbffd"
    ]

    endpoint_public_access  = true
    endpoint_private_access = true

    public_access_cidrs = [
      "0.0.0.0/0"
    ]
  }
  zonal_shift_config {
    enabled = false
  }
  depends_on = [
  aws_iam_role_policy_attachment.eks_cluster_policy
]
}
