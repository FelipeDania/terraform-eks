output "eks_vpc_config" {
  value = aws_eks_cluster.eks_cluster.vpc_config
}

output "tls_certificate_identity" {
  value = data.tls_certificate.eks_oidc_tls_certificate
}