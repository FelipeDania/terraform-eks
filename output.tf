output "subnet_public_1a" {
  value = module.eks_network.subnet_public_1a
}

output "eks_vpc_config_out" {
  value = module.eks_cluster.eks_vpc_config
}

output "eks_cluster_certificate_identity" {
  value = module.eks_cluster.tls_certificate_identity
}