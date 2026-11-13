resource "aws_eks_addon" "ebs_csi" {
  cluster_name = aws_eks_cluster.pathnex.name
  addon_name   = "aws-ebs-csi-driver"

  addon_version = "v1.63.1-eksbuild.1"

  depends_on = [
    aws_iam_role_policy_attachment.ebs_csi,
    aws_eks_cluster.pathnex,
    aws_eks_addon.pod_identity,
    aws_eks_node_group.pathnex-NG
  ]
}


resource "aws_eks_addon" "coredns" {
  cluster_name  = "Pathnex-Nov-2026"
  addon_name    = "coredns"
  addon_version = "v1.14.3-eksbuild.3"
  depends_on    = [aws_eks_cluster.pathnex,
                  aws_eks_node_group.pathnex-NG
                    ]

}

resource "aws_eks_addon" "node_monitoring" {
  cluster_name  = "Pathnex-Nov-2026"
  addon_name    = "eks-node-monitoring-agent"
  addon_version = "v1.7.0-eksbuild.1"
  depends_on    = [aws_eks_cluster.pathnex,
                  aws_eks_node_group.pathnex-NG]
}

resource "aws_eks_addon" "pod_identity" {
  cluster_name  = "Pathnex-Nov-2026"
  addon_name    = "eks-pod-identity-agent"
  addon_version = "v1.3.10-eksbuild.3"
  depends_on    = [aws_eks_cluster.pathnex,
                  aws_eks_node_group.pathnex-NG]
}

resource "aws_eks_addon" "external_dns" {
  cluster_name  = "Pathnex-Nov-2026"
  addon_name    = "external-dns"
  addon_version = "v0.21.0-eksbuild.6"
  depends_on    = [aws_eks_cluster.pathnex,
                  aws_eks_node_group.pathnex-NG]
}

resource "aws_eks_addon" "kube_proxy" {
  cluster_name  = "Pathnex-Nov-2026"
  addon_name    = "kube-proxy"
  addon_version = "v1.35.3-eksbuild.13"
  depends_on    = [aws_eks_cluster.pathnex,
                  aws_eks_node_group.pathnex-NG]
}

resource "aws_eks_addon" "metrics_server" {
  cluster_name  = "Pathnex-Nov-2026"
  addon_name    = "metrics-server"
  addon_version = "v0.9.0-eksbuild.5"
  depends_on    = [aws_eks_cluster.pathnex,
                  aws_eks_node_group.pathnex-NG]
}

resource "aws_eks_addon" "vpc_cni" {
  cluster_name  = "Pathnex-Nov-2026"
  addon_name    = "vpc-cni"
  addon_version = "v1.22.4-eksbuild.3"
  depends_on    = [aws_eks_cluster.pathnex,
                  aws_eks_node_group.pathnex-NG]
}
